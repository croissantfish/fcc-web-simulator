<script setup>
import { computed, ref } from 'vue'
import { Search } from '@lucide/vue'
import { formatValue } from '../simulator/isa.js'

const props = defineProps({
  registers: { type: Array, default: () => [] },
  radix: { type: [Number, String], default: 16 },
})
const emit = defineEmits(['update:radix', 'edit'])
const query = ref('')
const filtered = computed(() => {
  const needle = query.value.trim().toLowerCase()
  return props.registers.filter((row) => !needle || `${row.abi} ${row.number}`.toLowerCase().includes(needle))
})
</script>

<template>
  <section class="panel register-panel">
    <header class="panel-header">
      <div>
        <h2>寄存器</h2>
        <span class="count-badge">{{ registers.length }}</span>
      </div>
      <select class="compact-select" :value="radix" title="数值显示进制" @change="emit('update:radix', $event.target.value)">
        <option value="16">HEX</option>
        <option value="10">DEC</option>
        <option value="unsigned">UINT</option>
        <option value="2">BIN</option>
      </select>
    </header>
    <div class="register-search">
      <Search :size="13" />
      <input v-model="query" placeholder="筛选寄存器…" aria-label="筛选寄存器">
    </div>
    <div class="register-table-wrap">
      <table class="register-table">
        <thead><tr><th>寄存器</th><th>编号</th><th>值</th></tr></thead>
        <tbody>
          <tr v-for="row in filtered" :key="row.number" :class="{ changed: row.changed, special: row.abi === 'pc' }">
            <td><span class="register-name">{{ row.abi }}</span></td>
            <td class="register-number">{{ row.number }}</td>
            <td>
              <input
                class="register-value mono"
                :value="formatValue(row.value, radix === 'unsigned' ? 'unsigned' : Number(radix))"
                :aria-label="`修改 ${row.abi}`"
                :title="`${row.value | 0} · 点击编辑后回车`"
                @change="emit('edit', row.index, $event.target.value)"
              >
            </td>
          </tr>
        </tbody>
      </table>
      <div v-if="!filtered.length" class="empty-message">没有匹配的寄存器</div>
    </div>
  </section>
</template>
