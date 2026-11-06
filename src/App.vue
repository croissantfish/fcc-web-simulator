<script setup>
import { computed, onBeforeUnmount, onMounted, ref, watch } from 'vue'
import {
  Braces, ChevronRight, CircleHelp, Cpu, Download, FolderOpen, Pause,
  Play, RotateCcw, StepForward, X, Zap,
} from '@lucide/vue'
import EditorPanel from './components/EditorPanel.vue'
import RegisterPanel from './components/RegisterPanel.vue'
import MemoryPanel from './components/MemoryPanel.vue'
import ConsolePanel from './components/ConsolePanel.vue'
import { EXAMPLES } from './examples.js'
import { Simulator } from './simulator/index.js'
import { ARCHITECTURES } from './simulator/isa.js'
import { hex } from './simulator/memory.js'

const architecture = ref('mips')
const selectedExample = ref('gcd')
const source = ref(EXAMPLES.mips[0].code)
const input = ref(EXAMPLES.mips[0].input)
const simulator = ref(new Simulator('mips'))
const revision = ref(0)
const status = ref('edited')
const sourceDirty = ref(true)
const running = ref(false)
const stopRequested = ref(false)
const breakpoints = ref(new Set())
const radix = ref('16')
const error = ref('')
const errorLine = ref(0)
const fileInput = ref(null)
const helpOpen = ref(false)
const notice = ref('编辑代码后点击运行，或按 F9 单步执行')
let executionId = 0

const config = computed(() => ARCHITECTURES[architecture.value])
const examples = computed(() => EXAMPLES[architecture.value])
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
  edited: '代码已修改', ready: '就绪', running: '正在执行', paused: '已暂停',
  finished: '执行完成', error: '执行错误', empty: '未装载',
}[status.value] || status.value))
const activeExample = computed(() => examples.value.find((example) => example.id === selectedExample.value))

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
  error.value = ''
  errorLine.value = 0
  try {
    simulator.value.load(source.value, input.value)
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
  if (sourceDirty.value || !simulator.value.program || simulator.value.status === 'finished') return loadProgram()
  simulator.value.setInput(input.value)
  return true
}

function refresh() {
  status.value = simulator.value.status
  revision.value += 1
}

async function runExecution(extraBreakpoints = new Set()) {
  if (running.value || !ensureProgram()) return
  const active = simulator.value
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

function stepOnce() {
  if (running.value || !ensureProgram()) return
  try {
    const result = simulator.value.step()
    notice.value = result.reason === 'finished'
      ? '程序已结束'
      : `单步执行 · ${currentInstruction.value?.raw || ''}`
    refresh()
  } catch (exception) {
    recordError(exception)
  }
  revision.value += 1
}

function stepOver() {
  if (!ensureProgram()) return
  if (simulator.value.isCall()) runExecution(new Set([(simulator.value.pc + 4) >>> 0]))
  else stepOnce()
}

function resetProgram() {
  sourceDirty.value = true
  loadProgram()
}

function toggleRun() {
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
  notice.value = '代码已修改，下次运行将重新汇编'
}

function selectExample(id) {
  const example = examples.value.find((item) => item.id === id)
  if (!example) return
  selectedExample.value = id
  source.value = example.code
  input.value = example.input
  breakpoints.value = new Set()
  sourceDirty.value = true
  loadProgram()
}

function changeArchitecture(id) {
  if (architecture.value === id) return
  executionId += 1
  running.value = false
  architecture.value = id
  simulator.value = new Simulator(id)
  selectedExample.value = 'gcd'
  source.value = EXAMPLES[id][0].code
  input.value = EXAMPLES[id][0].input
  breakpoints.value = new Set()
  sourceDirty.value = true
  loadProgram()
}

function openFile() {
  fileInput.value?.click()
}

async function readFile(event) {
  const file = event.target.files?.[0]
  if (!file) return
  source.value = await file.text()
  selectedExample.value = ''
  sourceDirty.value = true
  notice.value = `已打开 ${file.name}`
  loadProgram()
  event.target.value = ''
}

function downloadFile() {
  const blob = new Blob([source.value], { type: 'text/plain;charset=utf-8' })
  const url = URL.createObjectURL(blob)
  const link = document.createElement('a')
  link.href = url
  link.download = architecture.value === 'mips' ? 'main-mips.s' : 'main-riscv.s'
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

function clearOutput() {
  simulator.value.output = ''
  revision.value += 1
}

function handleKeyboard(event) {
  if (event.key === 'Escape') helpOpen.value = false
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
  if (simulator.value.program && !running.value) simulator.value.setInput(value)
})
watch(source, (value) => localStorage.setItem(`fcc-asm-v2-${architecture.value}`, value))

onMounted(() => {
  try {
    const saved = localStorage.getItem('fcc-asm-v2-mips')
    if (saved) source.value = saved
  } catch {}
  loadProgram()
  window.addEventListener('keydown', handleKeyboard)
})
onBeforeUnmount(() => window.removeEventListener('keydown', handleKeyboard))
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
        <button class="button ghost" @click="openFile"><FolderOpen :size="15" />打开</button>
        <button class="button ghost" @click="downloadFile"><Download :size="15" />导出</button>
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
      <div class="execution-controls">
        <button class="button primary run-button" @click="toggleRun">
          <Pause v-if="running" :size="15" fill="currentColor" />
          <Play v-else :size="15" fill="currentColor" />
          {{ running ? '暂停' : status === 'finished' ? '重新运行' : status === 'paused' ? '继续' : '运行' }}
          <kbd>F5</kbd>
        </button>
        <button class="button tool-button" :disabled="running" title="单步执行 (F9)" @click="stepOnce"><StepForward :size="16" /><span>单步</span><kbd>F9</kbd></button>
        <button class="button tool-button" :disabled="running" title="步过函数调用 (F10)" @click="stepOver"><ChevronRight :size="17" /><span>步过</span><kbd>F10</kbd></button>
        <button class="icon-button reset-button" :disabled="running" title="重置执行" @click="resetProgram"><RotateCcw :size="16" /></button>
      </div>
      <div class="toolbar-state">
        <span class="state-pill" :class="status"><i />{{ statusLabel }}</span>
        <span class="pc-indicator mono">PC {{ simulator.program ? hex(simulator.pc) : '—' }}</span>
      </div>
    </div>

    <div v-if="error" class="error-banner" role="alert"><span>{{ error }}</span><button @click="error = ''; errorLine = 0"><X :size="14" /></button></div>

    <main class="workspace" :class="{ 'with-error': error }">
      <EditorPanel
        v-model:source="source"
        :breakpoints="breakpoints"
        :current-line="currentLine"
        :error-line="errorLine"
        :running="running"
        :examples="examples"
        :selected-example="selectedExample"
        @update:source="onSourceChange"
        @toggle-breakpoint="toggleBreakpoint"
        @select-example="selectExample"
      />
      <aside class="inspector">
        <RegisterPanel v-model:radix="radix" :registers="registers" @edit="editRegister" />
        <MemoryPanel :simulator="simulator" :revision="revision" :radix="radix" />
      </aside>
      <ConsolePanel
        :output="simulator.output"
        :input="input"
        :status="status"
        :steps="simulator.steps || 0"
        :exit-code="simulator.exitCode"
        @update:input="input = $event"
        @clear="clearOutput"
      />
    </main>

    <footer class="status-bar">
      <div class="status-message"><span class="status-led" :class="status" />{{ notice }}</div>
      <div class="status-details">
        <span v-if="activeExample">{{ activeExample.description }}</span>
        <span>{{ breakpoints.size }} 个断点</span>
        <span>{{ simulator.program?.instructions.length || 0 }} 条静态指令</span>
        <span>{{ config.detail }} · 32-bit LE</span>
      </div>
    </footer>

    <div v-if="helpOpen" class="modal-backdrop" @click.self="helpOpen = false">
      <section class="help-modal">
        <header><div><span class="eyebrow">QUICK START</span><h2>汇编调试指南</h2></div><button class="icon-button" @click="helpOpen = false"><X :size="18" /></button></header>
        <div class="help-content">
          <div class="help-step"><span>01</span><div><h3>装载与运行</h3><p>选择架构和示例，或粘贴 FCC 编译器生成的汇编。标准输入在下方控制台填写。</p></div></div>
          <div class="help-step"><span>02</span><div><h3>设置断点</h3><p>点击指令所在行号。F5 执行到断点，F9 单步进入，F10 步过函数调用。</p></div></div>
          <div class="help-step"><span>03</span><div><h3>观察机器状态</h3><p>寄存器支持 HEX / DEC / UINT / BIN，值可直接编辑。内存视图可按 SP、FP、堆和数据段定位。</p></div></div>
          <div class="syscall-note"><strong>系统调用</strong><p>SPIM：print/read integer、string、char、sbrk、exit。RISC-V：read (63)、write (64)、exit (93)、sbrk (214)，并直接模拟 FCC 六个 I/O 函数。</p></div>
        </div>
        <footer><span>面向 FCC 编译原理课程设计</span><button class="button primary" @click="helpOpen = false">开始调试</button></footer>
      </section>
    </div>
  </div>
</template>
