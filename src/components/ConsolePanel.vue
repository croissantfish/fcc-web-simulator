<script setup>
import { ref } from 'vue'
import { Eraser, TerminalSquare } from '@lucide/vue'

defineProps({
  output: { type: String, default: '' },
  input: { type: String, default: '' },
  status: { type: String, default: 'empty' },
  steps: { type: Number, default: 0 },
  exitCode: { type: Number, default: null },
})
const emit = defineEmits(['update:input', 'clear'])
const tab = ref('output')
</script>

<template>
  <section class="panel console-panel">
    <header class="panel-header console-header">
      <div class="console-tabs">
        <button :class="{ active: tab === 'output' }" @click="tab = 'output'"><TerminalSquare :size="14" />输出控制台</button>
        <button :class="{ active: tab === 'input' }" @click="tab = 'input'">标准输入</button>
      </div>
      <button class="icon-button subtle" title="清空输出" @click="emit('clear')"><Eraser :size="14" /></button>
    </header>
    <div v-show="tab === 'output'" class="console-output" :class="{ placeholder: !output }">
      <pre v-if="output">{{ output }}</pre>
      <span v-else>程序输出将在这里显示。</span>
      <span class="console-cursor" />
    </div>
    <div v-show="tab === 'input'" class="console-input-wrap">
      <textarea
        :value="input"
        aria-label="标准输入"
        placeholder="在运行前输入 stdin 内容，例如：&#10;5"
        spellcheck="false"
        @input="emit('update:input', $event.target.value)"
      />
    </div>
    <footer class="console-footer">
      <span>{{ status === 'finished' ? `进程已退出，代码 ${exitCode ?? 0}` : 'stdout / stdin' }}</span>
      <span>{{ steps.toLocaleString() }} 条指令</span>
    </footer>
  </section>
</template>
