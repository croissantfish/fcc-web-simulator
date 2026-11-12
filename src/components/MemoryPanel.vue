<script setup>
import { computed, ref, watch } from 'vue'
import { ArrowDownToLine, MapPin } from '@lucide/vue'
import { hex, parseNumber } from '../simulator/memory.js'

const PAGE_SIZE = 4096
const STACK_WINDOW_SIZE = 1024 * 1024
const OFFSETS = Array.from({ length: 16 }, (_, index) => index.toString(16).toUpperCase().padStart(2, '0'))

const props = defineProps({
  simulator: { type: Object, required: true },
  revision: { type: Number, default: 0 },
})
const region = ref('stack')
const anchor = ref('sp')
const jumpAddress = ref('')
const customBase = ref(null)

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
  return props.simulator.getMemoryRows(baseAddress.value, 24)
})

const stackFrame = computed(() => {
  const { sp, fp } = pointers.value
  if (fp <= sp || fp - sp > STACK_WINDOW_SIZE) return null
  return { start: sp, end: fp }
})

const memorySegments = computed(() => {
  props.revision
  const simulator = props.simulator
  if (!simulator.program) return []
  const { config, program } = simulator
  const stackEnd = (config.stackTop + 4) >>> 0
  const stackStart = (stackEnd - STACK_WINDOW_SIZE) >>> 0
  const definitions = [
    {
      id: 'text', label: '代码', color: '#6c71c4',
      start: config.textBase,
      end: config.textBase + Math.max(program.instructions.length * 4, 4),
      used: Math.max(program.instructions.length * 4, 4),
    },
    {
      id: 'data', label: '数据', color: '#2aa198',
      start: program.dataStart,
      end: Math.max(program.dataEnd, program.dataStart + PAGE_SIZE),
      used: Math.max(0, program.dataEnd - program.dataStart),
    },
    {
      id: 'heap', label: '堆', color: '#b58900',
      start: program.heapStart,
      end: Math.max(simulator.heapPointer, program.heapStart + PAGE_SIZE),
      used: Math.max(0, simulator.heapPointer - program.heapStart),
    },
    {
      id: 'stack', label: '栈', color: '#859900',
      start: stackStart,
      end: stackEnd,
      used: Math.min(STACK_WINDOW_SIZE, Math.max(0, stackEnd - pointers.value.sp)),
    },
  ]
  return definitions.map((segment) => {
    const size = Math.max(1, segment.end - segment.start)
    const fill = segment.used > 0 ? Math.max(3, Math.min(100, segment.used / size * 100)) : 0
    const viewport = region.value === segment.id
      ? Math.max(0, Math.min(100, (baseAddress.value - segment.start) / size * 100))
      : null
    return { ...segment, size, fill, viewport }
  })
})

const activeSegment = computed(() => memorySegments.value.find((segment) => segment.id === region.value))

watch(region, () => { customBase.value = null })
watch(anchor, () => { customBase.value = null })

function jump() {
  try {
    customBase.value = (parseNumber(jumpAddress.value) & ~15) >>> 0
  } catch {
    jumpAddress.value = ''
  }
}

function selectRegion(id) {
  if (id !== 'text') region.value = id
}

function formatSize(bytes) {
  if (bytes < 1024) return `${bytes} B`
  if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(bytes % 1024 ? 1 : 0)} KiB`
  return `${(bytes / 1024 / 1024).toFixed(bytes % (1024 * 1024) ? 1 : 0)} MiB`
}

function hexByte(byte) {
  return byte.toString(16).padStart(2, '0')
}

function pointerClass(address) {
  const sp = address === pointers.value.sp
  const fp = pointers.value.fp > 0 && address === ((pointers.value.fp - 1) >>> 0)
  if (sp && fp) return 'sp-pointer fp-pointer'
  if (sp) return 'sp-pointer'
  if (fp) return 'fp-pointer'
  return null
}

function rowHasPointer(row) {
  const fp = pointers.value.fp > 0 ? (pointers.value.fp - 1) >>> 0 : null
  return [pointers.value.sp, fp].some((pointer) => pointer >= row.address && pointer < row.address + 16)
}

function inStackFrame(address) {
  return region.value === 'stack' && stackFrame.value && address >= stackFrame.value.start && address < stackFrame.value.end
}

function rowInStackFrame(row) {
  return region.value === 'stack' && stackFrame.value
    && row.address + 16 > stackFrame.value.start && row.address < stackFrame.value.end
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
    </div>
    <div v-if="memorySegments.length" class="memory-map" aria-label="内存段分布图">
      <div class="memory-map-track">
        <button
          v-for="segment in memorySegments"
          :key="segment.id"
          class="memory-map-segment"
          :class="{ active: region === segment.id, static: segment.id === 'text' }"
          :style="{ '--segment-color': segment.color }"
          :disabled="segment.id === 'text'"
          :title="`${segment.label} ${hex(segment.start)} – ${hex(segment.end)} · ${formatSize(segment.used)} / ${formatSize(segment.size)}`"
          @click="selectRegion(segment.id)"
        >
          <span class="memory-map-fill" :style="{ width: `${segment.fill}%` }" />
          <span class="memory-map-label">{{ segment.label }}</span>
          <span v-if="segment.viewport !== null" class="memory-map-viewport" :style="{ left: `${segment.viewport}%` }" />
        </button>
      </div>
      <div v-if="activeSegment" class="memory-map-caption">
        <span>{{ activeSegment.label }} {{ hex(activeSegment.start) }}</span>
        <span v-if="region === 'stack' && stackFrame">栈帧 {{ stackFrame.end - stackFrame.start }} B</span>
        <span v-else>{{ formatSize(activeSegment.used) }} / {{ formatSize(activeSegment.size) }}</span>
        <span>{{ hex(activeSegment.end) }}</span>
      </div>
    </div>
    <div class="memory-table-wrap">
      <table class="memory-table">
        <colgroup><col class="memory-address-column"><col v-for="offset in OFFSETS" :key="offset"><col class="memory-ascii-column"></colgroup>
        <thead><tr><th>地址</th><th v-for="offset in OFFSETS" :key="offset" class="memory-byte">{{ offset }}</th><th>ASCII</th></tr></thead>
        <tbody>
          <tr
            v-for="row in rows"
            :key="row.address"
            :class="{ dirty: row.dirty.some(Boolean), pointer: rowHasPointer(row), 'stack-frame-row': rowInStackFrame(row) }"
          >
            <td class="memory-address">{{ hex(row.address) }}<ArrowDownToLine v-if="rowHasPointer(row)" :size="11" /></td>
            <td
              v-for="(byte, offset) in row.bytes"
              :key="offset"
              class="memory-byte"
              :class="[
                pointerClass((row.address + offset) >>> 0),
                {
                  dirty: row.dirty[offset],
                  'stack-frame': inStackFrame((row.address + offset) >>> 0),
                },
              ]"
              :title="hex((row.address + offset) >>> 0)"
            >{{ hexByte(byte) }}</td>
            <td class="memory-ascii" :class="{ 'stack-frame-row': rowInStackFrame(row) }">{{ row.ascii }}</td>
          </tr>
        </tbody>
      </table>
      <div v-if="!rows.length" class="empty-message">装载程序后可查看内存</div>
    </div>
  </section>
</template>
