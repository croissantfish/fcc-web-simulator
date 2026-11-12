<script setup>
import { computed, onBeforeUnmount, onMounted, ref, watch } from 'vue'
import {
  Braces, ChevronRight, CircleHelp, Cpu, Download, FileCode2, FilePlus2, FolderOpen, Monitor,
  Moon, Pause, Play, RotateCcw, StepForward, Sun, X, Zap,
} from '@lucide/vue'
import EditorPanel from './components/EditorPanel.vue'
import RegisterPanel from './components/RegisterPanel.vue'
import MemoryPanel from './components/MemoryPanel.vue'
import ConsolePanel from './components/ConsolePanel.vue'
import LicenseModal from './components/LicenseModal.vue'
import { EXAMPLES } from './examples.js'
import { Simulator } from './simulator/index.js'
import { ARCHITECTURES } from './simulator/isa.js'
import { hex } from './simulator/memory.js'

const WORKSPACE_KEY = 'fcc-asm-workspaces-v1'
let fileSequence = 0

function createWorkspace(architecture) {
  const example = EXAMPLES[architecture][0]
  return {
    files: [{ id: 'hello', name: 'HelloWorld.s', code: example.code, input: example.input }],
    selectedId: 'hello',
  }
}

function normalizeWorkspace(value, architecture) {
  if (!value || !Array.isArray(value.files)) return createWorkspace(architecture)
  const files = value.files.filter((file) => file && typeof file.id === 'string' && typeof file.name === 'string' && typeof file.code === 'string')
    .map((file) => ({ id: file.id, name: file.name, code: file.code, input: typeof file.input === 'string' ? file.input : '' }))
  const selectedId = files.some((file) => file.id === value.selectedId) ? value.selectedId : files[0]?.id || ''
  return { files, selectedId }
}

function readWorkspaces() {
  try {
    const saved = JSON.parse(localStorage.getItem(WORKSPACE_KEY) || 'null')
    return {
      mips: normalizeWorkspace(saved?.mips, 'mips'),
      riscv: normalizeWorkspace(saved?.riscv, 'riscv'),
    }
  } catch {
    return { mips: createWorkspace('mips'), riscv: createWorkspace('riscv') }
  }
}

function uniqueFileName(files, name) {
  const names = new Set(files.map((file) => file.name))
  if (!names.has(name)) return name
  const dot = name.lastIndexOf('.')
  const stem = dot > 0 ? name.slice(0, dot) : name
  const extension = dot > 0 ? name.slice(dot) : ''
  let index = 2
  while (names.has(`${stem} (${index})${extension}`)) index += 1
  return `${stem} (${index})${extension}`
}

function createFileId() {
  fileSequence += 1
  return `file-${Date.now().toString(36)}-${fileSequence.toString(36)}`
}

const workspaces = ref({ mips: createWorkspace('mips'), riscv: createWorkspace('riscv') })
const architecture = ref('mips')
const source = ref(workspaces.value.mips.files[0].code)
const input = ref(workspaces.value.mips.files[0].input)
const simulator = ref(new Simulator('mips'))
const revision = ref(0)
const status = ref('edited')
const sourceDirty = ref(true)
const running = ref(false)
const stopRequested = ref(false)
const breakpoints = ref(new Set())
const consoleView = ref('merged')
const radix = ref('16')
const error = ref('')
const errorLine = ref(0)
const fileInput = ref(null)
const helpOpen = ref(false)
const licenseOpen = ref(false)
const examplePickerOpen = ref(false)
const notice = ref('编辑代码后点击运行，或按 F9 单步执行')
const themeMode = ref('system')
const resolvedTheme = ref('dark')
let themeMedia = null
let inputResumeMode = 'run'
let inputResumeBreakpoints = new Set()
let executionId = 0

const config = computed(() => ARCHITECTURES[architecture.value])
const examples = computed(() => EXAMPLES[architecture.value])
const workspace = computed(() => workspaces.value[architecture.value])
const files = computed(() => workspace.value.files)
const selectedFileId = computed(() => workspace.value.selectedId)
const currentFile = computed(() => files.value.find((file) => file.id === selectedFileId.value))
const canStage = computed(() => Boolean(currentFile.value && source.value !== currentFile.value.code))
const currentInstruction = computed(() => {
  revision.value
  return simulator.value.program?.instructionMap.get(simulator.value.pc)
})
const currentLine = computed(() => currentInstruction.value?.line || 0)
const registers = computed(() => {
  revision.value
  return simulator.value.getRegisters()
})
const breakpointAddresses = computed(() => new Set(
  [...breakpoints.value].map((line) => simulator.value.program?.lineMap.get(line)).filter((pc) => pc !== undefined),
))
const statusLabel = computed(() => ({
  edited: '代码已修改', ready: '就绪', running: '正在执行', paused: '已暂停', waiting: '等待输入',
  finished: '执行完成', error: '执行错误', empty: '未装载',
}[status.value] || status.value))

function recordError(exception) {
  error.value = exception.message
  const match = exception.message.match(/第 (\d+) 行/)
  errorLine.value = match ? Number(match[1]) : 0
  status.value = 'error'
  notice.value = exception.message
}

function loadProgram() {
  executionId += 1
  running.value = false
  stopRequested.value = false
  inputResumeMode = 'run'
  inputResumeBreakpoints = new Set()
  error.value = ''
  errorLine.value = 0
  try {
    simulator.value.load(source.value, consoleView.value === 'merged' ? '' : input.value)
    simulator.value.interactive = consoleView.value === 'merged'
    sourceDirty.value = false
    status.value = 'ready'
    notice.value = `已从 ${simulator.value.program.entryName} 装载 ${simulator.value.program.instructions.length} 条指令`
    revision.value += 1
    return true
  } catch (exception) {
    status.value = 'error'
    recordError(exception)
    revision.value += 1
    return false
  }
}

function ensureProgram() {
  if (canStage.value) stageCurrentFile()
  if (sourceDirty.value || !simulator.value.program || simulator.value.status === 'finished') return loadProgram()
  return true
}

function prepareExecutionInput(active) {
  active.interactive = consoleView.value === 'merged'
  if (active.steps === 0 && active.status !== 'waiting') active.setInput(active.interactive ? '' : input.value)
}

function refresh() {
  status.value = simulator.value.status
  revision.value += 1
}

async function runExecution(extraBreakpoints = new Set()) {
  if (running.value || !ensureProgram()) return
  const active = simulator.value
  prepareExecutionInput(active)
  const id = ++executionId
  const allBreakpoints = new Set([...breakpointAddresses.value, ...extraBreakpoints])
  const continueFromBreakpoint = status.value === 'paused' && allBreakpoints.has(active.pc)
  running.value = true
  stopRequested.value = false
  status.value = 'running'
  notice.value = '程序正在执行…'
  let firstBatch = true
  let total = 0
  try {
    while (id === executionId && !stopRequested.value && active.status !== 'finished') {
      const result = active.run(allBreakpoints, {
        maxSteps: 5000,
        skipCurrent: firstBatch && continueFromBreakpoint,
      })
      total += result.steps
      firstBatch = false
      revision.value += 1
      if (result.reason === 'input') {
        inputResumeMode = 'run'
        inputResumeBreakpoints = new Set(extraBreakpoints)
        notice.value = '程序等待标准输入，请在终端中输入一行并回车'
        break
      }
      if (result.reason === 'breakpoint') {
        notice.value = `命中断点 · 第 ${active.program.instructionMap.get(active.pc)?.line ?? '—'} 行`
        break
      }
      if (result.reason === 'finished') {
        notice.value = `执行完成，共 ${active.steps.toLocaleString()} 条指令`
        break
      }
      if (total >= 10000000) {
        active.status = 'paused'
        notice.value = '已达到 1000 万条指令保护上限，程序已暂停'
        break
      }
      await new Promise((resolve) => setTimeout(resolve, 0))
    }
    if (stopRequested.value) {
      active.status = 'paused'
      notice.value = '已暂停，可检查状态后继续执行'
    }
  } catch (exception) {
    recordError(exception)
  } finally {
    if (id === executionId) {
      running.value = false
      status.value = active.status
      revision.value += 1
    }
  }
}

function stepOnce(resumeInput = false) {
  if (running.value || (status.value === 'waiting' && !resumeInput) || !ensureProgram()) return
  const active = simulator.value
  prepareExecutionInput(active)
  try {
    const result = active.step()
    if (result.reason === 'input') {
      inputResumeMode = 'step'
      inputResumeBreakpoints = new Set()
    }
    notice.value = result.reason === 'finished'
      ? '程序已结束'
      : result.reason === 'input'
        ? '程序等待标准输入，请在终端中输入一行并回车'
        : `单步执行 · ${currentInstruction.value?.raw || ''}`
    refresh()
  } catch (exception) {
    recordError(exception)
  }
  revision.value += 1
}

function stepOver() {
  if (running.value || status.value === 'waiting' || !ensureProgram()) return
  if (simulator.value.isCall()) runExecution(new Set([(simulator.value.pc + 4) >>> 0]))
  else stepOnce()
}

function resetProgram() {
  sourceDirty.value = true
  loadProgram()
}

function toggleRun() {
  if (status.value === 'waiting') return
  if (running.value) stopRequested.value = true
  else runExecution()
}

function toggleBreakpoint(line) {
  const next = new Set(breakpoints.value)
  if (next.has(line)) next.delete(line)
  else next.add(line)
  breakpoints.value = next
  notice.value = next.has(line) ? `已在第 ${line} 行设置断点` : `已移除第 ${line} 行的断点`
}

function onSourceChange(value) {
  source.value = value
  sourceDirty.value = true
  status.value = 'edited'
  error.value = ''
  errorLine.value = 0
  notice.value = '代码已修改，下次运行将自动暂存并重新汇编；也可点击暂存保存到浏览器'
}

function saveWorkspaces() {
  try {
    localStorage.setItem(WORKSPACE_KEY, JSON.stringify(workspaces.value))
  } catch {
    notice.value = '浏览器本地存储不可用或空间不足，无法保存文件列表'
  }
}

function activateFile(id) {
  const file = files.value.find((item) => item.id === id)
  if (!file) return false
  workspace.value.selectedId = id
  source.value = file.code
  input.value = file.input
  breakpoints.value = new Set()
  sourceDirty.value = true
  loadProgram()
  saveWorkspaces()
  return true
}

function selectFile(id) {
  if (id === selectedFileId.value) return
  if (activateFile(id)) notice.value = `已切换到 ${currentFile.value.name}`
}

function importExample(id) {
  const example = examples.value.find((item) => item.id === id)
  if (!example) return
  const fileId = id === 'hello' ? 'hello' : `example-${id}`
  let file = files.value.find((item) => item.id === fileId)
  if (!file) {
    file = {
      id: fileId,
      name: uniqueFileName(files.value, id === 'hello' ? 'HelloWorld.s' : `${example.name}.s`),
      code: example.code,
      input: example.input,
    }
    workspace.value.files.push(file)
  }
  examplePickerOpen.value = false
  activateFile(file.id)
  notice.value = `已导入 ${file.name}`
}

function deleteFile(id) {
  const index = workspace.value.files.findIndex((file) => file.id === id)
  if (index < 0) return
  const [removed] = workspace.value.files.splice(index, 1)
  if (selectedFileId.value === id) {
    const next = files.value[Math.min(index, files.value.length - 1)]
    workspace.value.selectedId = next?.id || ''
    source.value = next?.code || ''
    input.value = next?.input || ''
    breakpoints.value = new Set()
    sourceDirty.value = true
    if (next) {
      loadProgram()
    } else {
      executionId += 1
      running.value = false
      simulator.value = new Simulator(architecture.value)
      status.value = 'empty'
      revision.value += 1
    }
  }
  saveWorkspaces()
  notice.value = `已关闭 ${removed.name}`
}

function stageCurrentFile() {
  if (!canStage.value) return
  currentFile.value.code = source.value
  currentFile.value.input = input.value
  saveWorkspaces()
  notice.value = `已暂存 ${currentFile.value.name} 到浏览器，不会修改本地文件`
}

function changeArchitecture(id) {
  if (architecture.value === id) return
  executionId += 1
  running.value = false
  architecture.value = id
  simulator.value = new Simulator(id)
  source.value = currentFile.value?.code || ''
  input.value = currentFile.value?.input || ''
  breakpoints.value = new Set()
  sourceDirty.value = true
  if (currentFile.value) {
    loadProgram()
  } else {
    status.value = 'empty'
    revision.value += 1
  }
}

function openFile() {
  fileInput.value?.click()
}

async function readFile(event) {
  const file = event.target.files?.[0]
  if (!file) return
  try {
    const opened = {
      id: createFileId(),
      name: uniqueFileName(files.value, file.name),
      code: await file.text(),
      input: '',
    }
    workspace.value.files.push(opened)
    activateFile(opened.id)
    notice.value = `已打开 ${opened.name}`
  } catch (exception) {
    recordError(exception)
  } finally {
    event.target.value = ''
  }
}

function downloadFile() {
  const blob = new Blob([source.value], { type: 'text/plain;charset=utf-8' })
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.href = url
  link.download = currentFile.value?.name || (architecture.value === 'mips' ? 'main-mips.s' : 'main-riscv.s')
  link.click()
  URL.revokeObjectURL(url)
  notice.value = '汇编文件已导出'
}

function editRegister(index, value) {
  try {
    simulator.value.editRegister(index, value)
    revision.value += 1
    notice.value = '寄存器值已更新'
  } catch (exception) {
    recordError(exception)
  }
}

function submitInput(text) {
  const active = simulator.value
  if (consoleView.value !== 'merged' || active.status !== 'waiting') return
  active.appendInput(`${text}\n`)
  active.appendText(`${text}\n`)
  revision.value += 1
  if (inputResumeMode === 'step') stepOnce(true)
  else runExecution(inputResumeBreakpoints)
}

function clearOutput() {
  simulator.value.output = ''
  revision.value += 1
}

function handleKeyboard(event) {
  if (event.key === 'Escape') {
    helpOpen.value = false
    examplePickerOpen.value = false
  }
  if (event.key === 'F5') {
    event.preventDefault()
    toggleRun()
  } else if (event.key === 'F9') {
    event.preventDefault()
    stepOnce()
  } else if (event.key === 'F10') {
    event.preventDefault()
    stepOver()
  }
}

watch(input, (value) => {
  if (consoleView.value === 'split' && simulator.value.program && !running.value && status.value !== 'waiting') {
    simulator.value.setInput(value)
  }
})
watch(consoleView, (value) => {
  if (!simulator.value.program || running.value || status.value === 'waiting') return
  simulator.value.interactive = value === 'merged'
  if (simulator.value.steps === 0) simulator.value.setInput(value === 'merged' ? '' : input.value)
})

function applyTheme() {
  const theme = themeMode.value === 'system' ? (themeMedia?.matches ? 'dark' : 'light') : themeMode.value
  resolvedTheme.value = theme
  document.documentElement.dataset.theme = theme
  document.documentElement.style.colorScheme = theme
}

function setThemeMode(mode) {
  themeMode.value = mode
  try { localStorage.setItem('fcc-asm-theme', mode) } catch {}
  applyTheme()
}

function toggleTheme() {
  setThemeMode(resolvedTheme.value === 'dark' ? 'light' : 'dark')
}

function toggleSystemTheme() {
  setThemeMode(themeMode.value === 'system' ? resolvedTheme.value : 'system')
}

function handleSystemThemeChange() {
  if (themeMode.value === 'system') applyTheme()
}

onMounted(() => {
  themeMedia = window.matchMedia('(prefers-color-scheme: dark)')
  workspaces.value = readWorkspaces()
  source.value = currentFile.value?.code || ''
  input.value = currentFile.value?.input || ''
  try {
    const savedTheme = localStorage.getItem('fcc-asm-theme')
    if (['system', 'light', 'dark'].includes(savedTheme)) themeMode.value = savedTheme
  } catch {}
  applyTheme()
  themeMedia.addEventListener('change', handleSystemThemeChange)
  if (currentFile.value) {
    loadProgram()
  } else {
    status.value = 'empty'
    revision.value += 1
  }
  window.addEventListener('keydown', handleKeyboard)
})
onBeforeUnmount(() => {
  window.removeEventListener('keydown', handleKeyboard)
  themeMedia?.removeEventListener('change', handleSystemThemeChange)
})
</script>

<template>
  <div class="app-shell">
    <header class="app-header">
      <div class="brand">
        <div class="brand-mark"><Braces :size="22" stroke-width="2.2" /></div>
        <div><strong>FCC</strong><span>ASM LAB</span></div>
        <span class="brand-divider" />
        <span class="brand-subtitle">汇编调试工作台</span>
      </div>
      <div class="header-actions">
        <button class="button ghost" @click="examplePickerOpen = true"><FilePlus2 :size="15" />导入样例</button>
        <button class="button ghost" @click="openFile"><FolderOpen :size="15" />打开</button>
        <button class="button ghost" @click="downloadFile"><Download :size="15" />导出</button>
        <div class="theme-controls">
          <button class="button ghost theme-toggle" :title="resolvedTheme === 'dark' ? '切换到浅色模式' : '切换到深色模式'" @click="toggleTheme">
            <Sun v-if="resolvedTheme === 'dark'" :size="15" />
            <Moon v-else :size="15" />
            <span>{{ resolvedTheme === 'dark' ? '浅色' : '深色' }}</span>
          </button>
          <button
            class="icon-button subtle system-theme"
            :class="{ active: themeMode === 'system' }"
            :aria-pressed="themeMode === 'system'"
            :title="themeMode === 'system' ? '正在跟随系统配色，点击取消' : '跟随系统配色'"
            @click="toggleSystemTheme"
          ><Monitor :size="15" /></button>
        </div>
        <button class="icon-button help-button" title="使用指南" @click="helpOpen = true"><CircleHelp :size="18" /></button>
        <input ref="fileInput" type="file" accept=".s,.asm,.S" hidden @change="readFile">
      </div>
    </header>

    <div class="debug-toolbar">
      <div class="architecture-switch" aria-label="目标架构">
        <button :class="{ active: architecture === 'mips' }" @click="changeArchitecture('mips')">
          <Cpu :size="15" /><span>SPIM</span><small>MIPS32</small>
        </button>
        <button :class="{ active: architecture === 'riscv' }" @click="changeArchitecture('riscv')">
          <Zap :size="15" /><span>RISC-V</span><small>RV32IM</small>
        </button>
      </div>
      <span class="toolbar-divider" />
      <div class="toolbar-state">
        <span class="state-pill" :class="status"><i />{{ statusLabel }}</span>
        <span class="pc-indicator mono">PC {{ simulator.program ? hex(simulator.pc) : '—' }}</span>
      </div>
      <span class="toolbar-divider" />
      <div class="execution-controls">
        <button class="button primary run-button" :disabled="status === 'waiting'" @click="toggleRun">
          <Pause v-if="running" :size="15" fill="currentColor" />
          <Play v-else :size="15" fill="currentColor" />
          {{ running ? '暂停' : status === 'waiting' ? '等待输入' : status === 'finished' ? '重新运行' : status === 'paused' ? '继续' : '运行' }}
          <kbd>F5</kbd>
        </button>
        <button class="button tool-button" :disabled="running || status === 'waiting'" title="单步执行 (F9)" @click="stepOnce"><StepForward :size="16" /><span>单步</span><kbd>F9</kbd></button>
        <button class="button tool-button" :disabled="running || status === 'waiting'" title="步过函数调用 (F10)" @click="stepOver"><ChevronRight :size="17" /><span>步过</span><kbd>F10</kbd></button>
        <button class="icon-button reset-button" :disabled="running" title="重置执行" @click="resetProgram"><RotateCcw :size="16" /></button>
      </div>
    </div>

    <div v-if="error" class="error-banner" role="alert"><span>{{ error }}</span><button @click="error = ''; errorLine = 0"><X :size="14" /></button></div>

    <main class="workspace" :class="{ 'with-error': error }">
      <EditorPanel
        v-model:source="source"
        :breakpoints="breakpoints"
        :current-line="currentLine"
        :error-line="errorLine"
        :running="running || status === 'waiting'"
        :files="files"
        :selected-file-id="selectedFileId"
        :can-stage="canStage"
        @update:source="onSourceChange"
        @toggle-breakpoint="toggleBreakpoint"
        @select-file="selectFile"
        @delete-file="deleteFile"
        @stage="stageCurrentFile"
      />
      <RegisterPanel v-model:radix="radix" :registers="registers" :current-line="currentLine" :architecture="architecture" @edit="editRegister" />
      <MemoryPanel :simulator="simulator" :revision="revision" />
      <ConsolePanel
        v-model:view="consoleView"
        :output="simulator.output"
        :input="input"
        :status="status"
        :steps="simulator.steps || 0"
        :exit-code="simulator.exitCode"
        @update:input="input = $event"
        @submit="submitInput"
        @clear="clearOutput"
      />
    </main>

    <footer class="status-bar">
      <div class="status-message"><span class="status-led" :class="status" />{{ notice }}</div>
      <div class="status-details">
        <span>{{ breakpoints.size }} 个断点</span>
        <span>{{ simulator.program?.instructions.length || 0 }} 条静态指令</span>
        <span>{{ config.detail }} · 32-bit LE</span>
      </div>
      <div class="status-actions">
        <button class="status-license" aria-label="查看许可信息" title="查看许可信息" @click="licenseOpen = true">©</button>
        <a class="status-github" href="https://github.com/croissantfish/fcc-web-simulator" target="_blank" rel="noopener noreferrer" aria-label="GitHub 仓库" title="GitHub 仓库">
          <svg viewBox="0 0 24 24" fill="currentColor" aria-hidden="true"><path d="M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12" /></svg>
        </a>
      </div>
    </footer>

    <div v-if="examplePickerOpen" class="modal-backdrop" @click.self="examplePickerOpen = false">
      <section class="help-modal example-modal" role="dialog" aria-modal="true" aria-labelledby="example-picker-title">
        <header>
          <div><span class="eyebrow">EXAMPLES</span><h2 id="example-picker-title">导入预置样例</h2></div>
          <button class="icon-button" aria-label="关闭样例选择" @click="examplePickerOpen = false"><X :size="18" /></button>
        </header>
        <div class="example-picker">
          <p>选择 {{ config.name }} / {{ config.detail }} 汇编样例。导入后将新建或切换到对应文件标签页，并载入样例的默认输入。</p>
          <div class="example-list">
            <button v-for="example in examples" :key="example.id" class="example-option" @click="importExample(example.id)">
              <FileCode2 :size="20" />
              <span class="example-option-text"><strong>{{ example.name }}</strong><small>{{ example.description }}</small></span>
              <ChevronRight :size="16" />
            </button>
          </div>
        </div>
        <footer><span>{{ config.name }} · {{ config.detail }}</span><button class="button ghost" @click="examplePickerOpen = false">取消</button></footer>
      </section>
    </div>

    <div v-if="helpOpen" class="modal-backdrop" @click.self="helpOpen = false">
      <section class="help-modal">
        <header><div><span class="eyebrow">QUICK START</span><h2>汇编调试指南</h2></div><button class="icon-button" @click="helpOpen = false"><X :size="18" /></button></header>
        <div class="help-content">
          <div class="help-step"><span>01</span><div><h3>装载与运行</h3><p>选择架构和示例，或粘贴 FCC 编译器生成的汇编。标准输入在下方控制台填写。</p></div></div>
          <div class="help-step"><span>02</span><div><h3>设置断点</h3><p>点击指令所在行号。F5 执行到断点，F9 单步进入，F10 步过函数调用。</p></div></div>
          <div class="help-step"><span>03</span><div><h3>观察机器状态</h3><p>寄存器支持 HEX / DEC / UINT / BIN，值可直接编辑。内存视图可按 SP、FP、堆和数据段定位。</p></div></div>
          <div class="syscall-note">
            <strong>FCC 运行时函数</strong>
            <ul class="runtime-list">
              <li><code>getint()</code> 读取带符号十进制整数；<code>getchar()</code> 读取字符，EOF 返回 -1。</li>
              <li><code>getstr(buf)</code> 读取一行到缓冲区，去掉换行并补 <code>\0</code>，返回字节数。</li>
              <li><code>putint(x)</code> 输出有符号整数；<code>putchar(c)</code> 输出字符；<code>putstr(s)</code> 输出 NUL 结尾字符串。</li>
              <li><code>malloc</code>、<code>__malloc_*</code> 提供堆分配后备实现；内置 <code>free</code>/<code>__free_*</code> 不回收内存。</li>
            </ul>
            <p>SPIM 使用 $a0–$a3 传参、$v0 返回；RISC-V 使用 a0–a7 传参、a0 返回。程序定义同名标签时，优先执行程序自身的运行时实现。</p>
          </div>
          <div class="syscall-note"><strong>系统调用</strong><p>SPIM：print/read integer、string、char、sbrk、exit。RISC-V：read (63)、write (64)、exit (93)、sbrk (214)。</p></div>
        </div>
        <footer>
          <span>面向 FCC 编译原理课程设计</span>
          <div class="help-footer-actions"><button class="button ghost" @click="licenseOpen = true">© 许可信息</button><button class="button primary" @click="helpOpen = false">开始调试</button></div>
        </footer>
      </section>
    </div>

    <LicenseModal :open="licenseOpen" @close="licenseOpen = false" />
  </div>
</template>
