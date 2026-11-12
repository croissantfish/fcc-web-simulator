<script setup>
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from 'vue'
import { ChevronLeft, ChevronRight, FileCode2, Save, X } from '@lucide/vue'
import { highlightAssembly } from '../highlight.js'

const props = defineProps({
  source: { type: String, required: true },
  breakpoints: { type: Set, required: true },
  currentLine: { type: Number, default: 0 },
  errorLine: { type: Number, default: 0 },
  running: Boolean,
  files: { type: Array, default: () => [] },
  selectedFileId: { type: String, default: '' },
  canStage: { type: Boolean, default: false },
})
const emit = defineEmits(['update:source', 'toggle-breakpoint', 'select-file', 'delete-file', 'stage'])
const editor = ref(null)
const gutter = ref(null)
const highlight = ref(null)
const tabs = ref(null)
const tabsOverflowing = ref(false)
const canScrollLeft = ref(false)
const canScrollRight = ref(false)
const lines = computed(() => props.source.split('\n'))
const highlighted = computed(() => lines.value.map(highlightAssembly))
let tabsObserver = null

function syncScroll() {
  if (gutter.value) gutter.value.scrollTop = editor.value.scrollTop
  if (highlight.value) {
    highlight.value.scrollTop = editor.value.scrollTop
    highlight.value.scrollLeft = editor.value.scrollLeft
  }
}

function updateTabs() {
  if (!tabs.value) return
  tabsOverflowing.value = tabs.value.scrollWidth > tabs.value.clientWidth + 1
  canScrollLeft.value = tabs.value.scrollLeft > 1
  canScrollRight.value = tabs.value.scrollLeft + tabs.value.clientWidth < tabs.value.scrollWidth - 1
}

function scrollTabs(direction) {
  tabs.value?.scrollBy({ left: direction * tabs.value.clientWidth * 0.7, behavior: 'smooth' })
}

async function revealSelectedTab() {
  await nextTick()
  if (!tabs.value) return
  updateTabs()
  if (!tabsOverflowing.value) return
  const active = tabs.value.querySelector('.editor-tab.active')
  if (!active) return
  const tabsBox = tabs.value.getBoundingClientRect()
  const activeBox = active.getBoundingClientRect()
  const left = tabs.value.scrollLeft + activeBox.left - tabsBox.left - 28
  tabs.value.scrollTo({ left: Math.max(0, left), behavior: 'smooth' })
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
watch(() => [props.files.length, props.selectedFileId], revealSelectedTab)

onMounted(async () => {
  tabsObserver = new ResizeObserver(updateTabs)
  if (tabs.value) tabsObserver.observe(tabs.value)
  await revealSelectedTab()
})
onBeforeUnmount(() => tabsObserver?.disconnect())
</script>

<template>
  <section class="panel editor-panel">
    <div class="editor-tabs-wrap" :class="{ overflowing: tabsOverflowing }">
      <button v-if="tabsOverflowing" class="editor-tabs-nav left" :disabled="!canScrollLeft" aria-label="向左滚动标签页" @click="scrollTabs(-1)"><ChevronLeft :size="14" /></button>
      <header ref="tabs" class="editor-tabs" role="tablist" aria-label="已打开文件" @scroll="updateTabs">
        <span v-if="!files.length" class="editor-tabs-empty">无已打开文件</span>
        <div v-for="file in files" :key="file.id" class="editor-tab" :class="{ active: file.id === selectedFileId }">
          <button class="editor-tab-select" role="tab" :aria-selected="file.id === selectedFileId" :title="file.name" @click="emit('select-file', file.id)">
            <FileCode2 :size="13" />
            <span>{{ file.name }}</span>
            <span v-if="file.id === selectedFileId && canStage" class="unsaved-dot" title="有未暂存修改" />
          </button>
          <button class="editor-tab-close" :aria-label="`关闭 ${file.name}`" :title="`关闭 ${file.name}`" @click="emit('delete-file', file.id)"><X :size="12" /></button>
        </div>
      </header>
      <button v-if="tabsOverflowing" class="editor-tabs-nav right" :disabled="!canScrollRight" aria-label="向右滚动标签页" @click="scrollTabs(1)"><ChevronRight :size="14" /></button>
    </div>
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
          <span v-if="currentLine === index + 1" class="pc-line-marker">PC</span>
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
      <button class="stage-button" :disabled="!canStage" title="仅暂存到浏览器，不会修改本地文件" @click="emit('stage')"><Save :size="11" />暂存</button>
      <span class="editor-hint">点击行号设置断点</span>
    </footer>
  </section>
</template>
