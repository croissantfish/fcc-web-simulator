<script setup>
import { computed, onBeforeUnmount, onMounted, ref } from 'vue'
import { CircleHelp, Search, X } from '@lucide/vue'
import { formatValue } from '../simulator/isa.js'

const props = defineProps({
  registers: { type: Array, default: () => [] },
  radix: { type: [Number, String], default: 16 },
  currentLine: { type: Number, default: 0 },
  architecture: { type: String, default: 'mips' },
})
const emit = defineEmits(['update:radix', 'edit'])
const query = ref('')
const aliasOpen = ref(false)
const pcRegister = computed(() => props.registers.find((row) => row.abi === 'pc'))
const generalRegisters = computed(() => props.registers.filter((row) => typeof row.index === 'number'))
const filtered = computed(() => {
  const needle = query.value.trim().toLowerCase()
  return props.registers.filter((row) => row.abi !== 'pc' && (!needle || `${row.abi} ${row.number}`.toLowerCase().includes(needle)))
})
const aliasIntro = computed(() => props.architecture === 'riscv'
  ? 'RISC-V 中 s0 与 fp 是同一个寄存器，物理编号均为 x8。'
  : 'MIPS 中 fp 与 s8 是同一个寄存器，物理编号均为 $30。')

const ASCII_ESCAPES = {
  8: '\\b', 9: '\\t', 10: '\\n', 11: '\\v', 12: '\\f', 13: '\\r', 32: '\\s', 39: "\\'", 92: '\\\\',
}

function asciiCharacter(value) {
  if (ASCII_ESCAPES[value] !== undefined) return `'${ASCII_ESCAPES[value]}'`
  const character = value < 32 || (value >= 127 && value <= 159)
    ? `\\x${value.toString(16).padStart(2, '0')}`
    : String.fromCharCode(value)
  return `'${character}'`
}

function registerAlias(row) {
  if (props.architecture === 'riscv' && row.abi === 's0') return 'fp'
  if (props.architecture === 'mips' && row.abi === 'fp') return 's8'
  return '—'
}

function handleEscape(event) {
  if (event.key === 'Escape') aliasOpen.value = false
}

onMounted(() => window.addEventListener('keydown', handleEscape))
onBeforeUnmount(() => window.removeEventListener('keydown', handleEscape))
</script>

<template>
  <section class="panel register-panel">
    <header class="panel-header">
      <div>
        <h2>寄存器</h2>
        <button class="icon-button subtle register-help" title="寄存器别名对照" aria-label="查看寄存器别名对照" @click="aliasOpen = true"><CircleHelp :size="13" /></button>
        <span class="count-badge">{{ registers.length }}</span>
      </div>
      <select class="compact-select" :value="radix" title="数值显示进制" @change="emit('update:radix', $event.target.value)">
        <option value="16">HEX</option>
        <option value="10">DEC</option>
        <option value="unsigned">UINT</option>
        <option value="2">BIN</option>
      </select>
    </header>
    <div v-if="pcRegister" class="register-pc">
      <div class="register-pc-identity">
        <span>PC</span>
        <small>程序计数器</small>
      </div>
      <span class="register-pc-line" :class="{ unknown: !currentLine }">{{ currentLine ? `第 ${currentLine} 行` : '无对应行' }}</span>
      <input
        class="register-pc-value mono"
        :value="formatValue(pcRegister.value, radix === 'unsigned' ? 'unsigned' : Number(radix))"
        aria-label="修改 PC"
        :title="`${pcRegister.value | 0} · 点击编辑后回车`"
        @change="emit('edit', pcRegister.index, $event.target.value)"
      >
    </div>
    <div class="register-search">
      <Search :size="13" />
      <input v-model="query" placeholder="筛选寄存器…" aria-label="筛选寄存器">
    </div>
    <div class="register-grid-wrap">
      <div class="register-grid">
        <div
          v-for="row in filtered"
          :key="row.number"
          class="register-cell"
          :class="{ changed: row.changed }"
        >
          <div class="register-main">
            <div class="register-identity">
              <span class="register-name">{{ row.abi }}</span>
              <small class="register-number">{{ row.number }}</small>
            </div>
            <input
              class="register-value mono"
              :value="formatValue(row.value, radix === 'unsigned' ? 'unsigned' : Number(radix))"
              :aria-label="`修改 ${row.abi}`"
              :title="`${row.value | 0} · 点击编辑后回车`"
              @change="emit('edit', row.index, $event.target.value)"
            >
          </div>
          <div class="register-details">
            <span>DEC {{ row.value | 0 }}</span>
            <span v-if="row.value >= 0 && row.value <= 255" class="register-ascii">ASCII {{ asciiCharacter(row.value) }}</span>
          </div>
        </div>
      </div>
      <div v-if="!filtered.length" class="empty-message">没有匹配的寄存器</div>
    </div>
  </section>

  <Teleport to="body">
    <div v-if="aliasOpen" class="modal-backdrop" @click.self="aliasOpen = false">
      <section class="help-modal register-alias-modal" role="dialog" aria-modal="true" aria-labelledby="register-alias-title">
        <header>
          <div><span class="eyebrow">REGISTER ABI</span><h2 id="register-alias-title">寄存器别名对照</h2></div>
          <button class="icon-button" aria-label="关闭寄存器别名对照" @click="aliasOpen = false"><X :size="18" /></button>
        </header>
        <div class="help-content">
          <p class="register-alias-intro">{{ aliasIntro }}</p>
          <table class="register-alias-table">
            <thead><tr><th>常用名</th><th>别名</th><th>物理寄存器</th></tr></thead>
            <tbody>
              <tr v-for="row in generalRegisters" :key="row.number" :class="{ 'alias-highlight': registerAlias(row) !== '—' }">
                <td>{{ row.abi }}</td>
                <td>{{ registerAlias(row) }}</td>
                <td>{{ row.number }}</td>
              </tr>
            </tbody>
          </table>
        </div>
        <footer><span>{{ architecture === 'riscv' ? 'PC 独立于 32 个通用寄存器' : 'PC、HI、LO 为独立特殊寄存器' }}</span><button class="button primary" @click="aliasOpen = false">知道了</button></footer>
      </section>
    </div>
  </Teleport>
</template>
