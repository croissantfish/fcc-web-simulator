<script setup>
import { nextTick, ref, watch } from 'vue'
import { Columns2, Eraser, Rows2, TerminalSquare } from '@lucide/vue'

const props = defineProps({
  output: { type: String, default: '' },
  input: { type: String, default: '' },
  status: { type: String, default: 'empty' },
  steps: { type: Number, default: 0 },
  exitCode: { type: Number, default: null },
  view: { type: String, default: 'split' },
})
const emit = defineEmits(['update:input', 'update:view', 'submit', 'clear'])
const line = ref('')
const mergedOutput = ref(null)
const terminalInput = ref(null)

function submitLine() {
  if (props.status !== 'waiting') return
  emit('submit', line.value)
  line.value = ''
}

function focusTerminal() {
  if (props.status === 'waiting') terminalInput.value?.focus()
}

watch(() => props.output, async () => {
  if (props.view !== 'merged') return
  await nextTick()
  if (mergedOutput.value) mergedOutput.value.scrollTop = mergedOutput.value.scrollHeight
})

watch(() => props.status, async (status) => {
  if (status !== 'waiting' || props.view !== 'merged') return
  await nextTick()
  if (mergedOutput.value) mergedOutput.value.scrollTop = mergedOutput.value.scrollHeight
  terminalInput.value?.focus()
})
</script>

<template>
  <section class="panel console-panel">
    <header class="panel-header console-header">
      <div class="console-title"><TerminalSquare :size="14" /><h2>控制台</h2></div>
      <div class="console-actions">
        <div class="segmented console-view-switch" aria-label="控制台布局">
          <button
            :class="{ active: view === 'split' }"
            :aria-pressed="view === 'split'"
            :disabled="status === 'running' || status === 'waiting'"
            @click="emit('update:view', 'split')"
          >
            <Columns2 :size="12" />分栏
          </button>
          <button
            :class="{ active: view === 'merged' }"
            :aria-pressed="view === 'merged'"
            :disabled="status === 'running' || status === 'waiting'"
            @click="emit('update:view', 'merged')"
          >
            <Rows2 :size="12" />融合
          </button>
        </div>
        <button class="icon-button subtle" title="清空输出" aria-label="清空输出" @click="emit('clear')"><Eraser :size="14" /></button>
      </div>
    </header>

    <div v-if="view === 'split'" class="console-split">
      <section class="console-pane">
        <header class="console-pane-header"><span>标准输出</span><span>stdout</span></header>
        <div class="console-output" :class="{ placeholder: !output }">
          <pre v-if="output">{{ output }}<span class="console-cursor" /></pre>
          <template v-else>
            <span class="console-cursor" />
            <span>程序输出将在这里显示。</span>
          </template>
        </div>
      </section>
      <section class="console-pane">
        <header class="console-pane-header"><span>标准输入</span><span>stdin</span></header>
        <div class="console-input-wrap">
          <textarea
            :value="input"
            aria-label="标准输入"
            placeholder="在运行前输入 stdin 内容，例如：&#10;5"
            spellcheck="false"
            @input="emit('update:input', $event.target.value)"
          />
        </div>
      </section>
    </div>

    <div v-else class="console-merged">
      <div
        ref="mergedOutput"
        class="console-output console-terminal"
        :class="{ placeholder: !output }"
        @click="focusTerminal"
      >
        <pre v-if="output">{{ output }}<span v-if="status !== 'waiting'" class="console-cursor" /></pre>
        <template v-if="!output && status !== 'waiting'">
          <span class="console-cursor" />
          <span>运行程序后，输出与输入将在这里显示。</span>
        </template>
        <form v-if="status === 'waiting'" class="console-inline-input" @submit.prevent="submitLine" @click.stop>
          <input
            ref="terminalInput"
            v-model="line"
            aria-label="在程序提示后输入一行内容"
            :style="{ width: `${Math.max(10, line.length + 1)}ch` }"
            autocomplete="off"
            spellcheck="false"
          >
        </form>
      </div>
    </div>

    <footer class="console-footer">
      <span>{{ status === 'finished' ? `进程已退出，代码 ${exitCode ?? 0}` : status === 'waiting' ? '在提示后输入 · 回车继续' : 'stdout / stdin' }}</span>
      <span>{{ steps.toLocaleString() }} 条指令</span>
    </footer>
  </section>
</template>
