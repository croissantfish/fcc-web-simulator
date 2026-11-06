<script setup>
import { computed, nextTick, ref, watch } from 'vue'
import { ChevronDown, FileCode2 } from '@lucide/vue'
import { highlightAssembly } from '../highlight.js'

const props = defineProps({
  source: { type: String, required: true },
  breakpoints: { type: Set, required: true },
  currentLine: { type: Number, default: 0 },
  errorLine: { type: Number, default: 0 },
  running: Boolean,
  examples: { type: Array, default: () => [] },
  selectedExample: { type: String, default: '' },
})
const emit = defineEmits(['update:source', 'toggle-breakpoint', 'select-example'])
const editor = ref(null)
const gutter = ref(null)
const highlight = ref(null)
const lines = computed(() => props.source.split('\n'))
const highlighted = computed(() => lines.value.map(highlightAssembly))

function syncScroll() {
  if (gutter.value) gutter.value.scrollTop = editor.value.scrollTop
  if (highlight.value) {
    highlight.value.scrollTop = editor.value.scrollTop
    highlight.value.scrollLeft = editor.value.scrollLeft
  }
}

function insertTab(event) {
  if (event.key !== 'Tab') return
  event.preventDefault()
  const target = event.target
  const start = target.selectionStart
  const end = target.selectionEnd
  const next = `${props.source.slice(0, start)}    ${props.source.slice(end)}`
  emit('update:source', next)
  nextTick(() => {
    target.selectionStart = target.selectionEnd = start + 4
  })
}

watch(() => props.currentLine, async (line) => {
  if (!line || !editor.value) return
  await nextTick()
  const top = (line - 1) * 22
  if (top < editor.value.scrollTop + 22 || top > editor.value.scrollTop + editor.value.clientHeight - 44) {
    editor.value.scrollTop = Math.max(0, top - editor.value.clientHeight / 2)
    syncScroll()
  }
})
</script>

<template>
  <section class="panel editor-panel">
    <header class="panel-header editor-header">
      <div class="file-title">
        <FileCode2 :size="16" />
        <span>main.s</span>
        <span class="unsaved-dot" title="当前文件" />
      </div>
      <label class="example-select">
        <select :value="selectedExample" @change="emit('select-example', $event.target.value)">
          <option v-for="example in examples" :key="example.id" :value="example.id">{{ example.name }}</option>
        </select>
        <ChevronDown :size="13" />
      </label>
    </header>
    <div class="editor-workspace">
      <div ref="gutter" class="line-gutter" aria-label="行号，点击设置断点">
        <button
          v-for="(_, index) in lines"
          :key="index"
          class="line-number"
          :class="{
            active: currentLine === index + 1,
            'has-breakpoint': breakpoints.has(index + 1),
            'has-error': errorLine === index + 1,
          }"
          :title="`第 ${index + 1} 行 · 点击切换断点`"
          @click="emit('toggle-breakpoint', index + 1)"
        >
          <span class="breakpoint-dot" />
          <span>{{ index + 1 }}</span>
        </button>
      </div>
      <div class="code-area" :class="{ 'is-running': running }">
        <pre ref="highlight" class="code-highlight" aria-hidden="true"><code><div
          v-for="(line, index) in highlighted"
          :key="index"
          class="code-line"
          :class="{ active: currentLine === index + 1, 'error-line': errorLine === index + 1 }"
          v-html="line"
        /></code></pre>
        <textarea
          ref="editor"
          class="code-input"
          :value="source"
          :readonly="running"
          aria-label="汇编代码编辑器"
          autocomplete="off"
          autocapitalize="off"
          spellcheck="false"
          wrap="off"
          @input="emit('update:source', $event.target.value)"
          @scroll="syncScroll"
          @keydown="insertTab"
        />
      </div>
    </div>
    <footer class="editor-footer">
      <span>汇编</span>
      <span>空格: 4</span>
      <span>UTF-8</span>
      <span class="editor-hint">点击行号设置断点</span>
    </footer>
  </section>
</template>
