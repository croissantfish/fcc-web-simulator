<script setup>
import { computed, ref, watch } from 'vue'
import { ArrowDownToLine, MapPin } from '@lucide/vue'
import { formatValue } from '../simulator/isa.js'
import { hex, parseNumber } from '../simulator/memory.js'

const props = defineProps({
  simulator: { type: Object, required: true },
  revision: { type: Number, default: 0 },
  radix: { type: [Number, String], default: 16 },
})
const region = ref('stack')
const anchor = ref('sp')
const jumpAddress = ref('')
const customBase = ref(null)
const radix = ref(props.radix)

const pointers = computed(() => {
  props.revision
  if (!props.simulator.program) return { sp: 0, fp: 0, heap: 0, data: 0 }
  return {
    sp: props.simulator.getRegister('sp') >>> 0,
    fp: props.simulator.architecture === 'mips'
      ? props.simulator.getRegister('fp') >>> 0
      : props.simulator.getRegister('s0') >>> 0,
    heap: props.simulator.program.heapStart,
    data: props.simulator.program.dataStart,
  }
})

const baseAddress = computed(() => {
  if (customBase.value !== null) return customBase.value
  if (region.value === 'stack') return (pointers.value[anchor.value] - 80) >>> 0
  return pointers.value[region.value]
})

const rows = computed(() => {
  props.revision
  if (!props.simulator.program) return []
  const words = props.simulator.getMemoryWords(baseAddress.value, 28)
  return region.value === 'stack' ? words.reverse() : words
})

watch(region, () => { customBase.value = null })
watch(anchor, () => { customBase.value = null })
watch(() => props.radix, (value) => { radix.value = value })

function jump() {
  try {
    customBase.value = parseNumber(jumpAddress.value) >>> 0
  } catch {
    jumpAddress.value = ''
  }
}
</script>

<template>
  <section class="panel memory-panel">
    <header class="panel-header memory-header">
      <div class="memory-title"><h2>内存视图</h2><span class="endian-badge">小端</span></div>
      <div class="segmented small">
        <button :class="{ active: region === 'stack' }" @click="region = 'stack'">堆栈</button>
        <button :class="{ active: region === 'heap' }" @click="region = 'heap'">堆</button>
        <button :class="{ active: region === 'data' }" @click="region = 'data'">数据</button>
      </div>
    </header>
    <div class="memory-toolbar">
      <template v-if="region === 'stack'">
        <button class="anchor-button" :class="{ active: anchor === 'sp' }" @click="anchor = 'sp'">SP {{ hex(pointers.sp) }}</button>
        <button class="anchor-button" :class="{ active: anchor === 'fp' }" @click="anchor = 'fp'">FP {{ hex(pointers.fp) }}</button>
      </template>
      <span v-else class="memory-base">{{ hex(pointers[region]) }}</span>
      <form class="address-jump" @submit.prevent="jump">
        <MapPin :size="12" />
        <input v-model="jumpAddress" placeholder="跳转地址" aria-label="内存跳转地址">
      </form>
      <select v-model="radix" class="compact-select" title="内存数值进制">
        <option value="16">HEX</option>
        <option value="10">DEC</option>
        <option value="2">BIN</option>
      </select>
    </div>
    <div class="memory-table-wrap">
      <table class="memory-table">
        <thead><tr><th>地址</th><th>偏移</th><th>字节</th><th>字值</th><th>ASCII</th></tr></thead>
        <tbody>
          <tr v-for="row in rows" :key="row.address" :class="{ dirty: row.dirty, pointer: row.address === pointers.sp || row.address === pointers.fp }">
            <td class="memory-address">{{ hex(row.address) }}<ArrowDownToLine v-if="row.address === pointers.sp || row.address === pointers.fp" :size="11" /></td>
            <td class="memory-offset">{{ region === 'stack' ? `${row.address - pointers.sp >= 0 ? '+' : ''}${row.address - pointers.sp}` : `+${row.address - baseAddress}` }}</td>
            <td class="memory-bytes">{{ [...row.bytes].map((byte) => byte.toString(16).padStart(2, '0')).join(' ') }}</td>
            <td class="memory-value" :class="{ changed: row.dirty }">{{ formatValue(row.value, Number(radix)) }}</td>
            <td class="memory-ascii">{{ row.ascii }}</td>
          </tr>
        </tbody>
      </table>
      <div v-if="!rows.length" class="empty-message">装载程序后可查看内存</div>
    </div>
  </section>
</template>
