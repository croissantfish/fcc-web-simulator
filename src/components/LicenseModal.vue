<script setup>
import { computed } from 'vue'
import { X } from '@lucide/vue'
import { marked } from 'marked'
import licenseText from '../../LICENSE?raw'

defineProps({
  open: { type: Boolean, default: false },
})
const emit = defineEmits(['close'])
const licenseHtml = computed(() => marked.parse(licenseText))
</script>

<template>
  <div v-if="open" class="modal-backdrop" @click.self="emit('close')">
    <section class="help-modal license-modal" role="dialog" aria-modal="true" aria-labelledby="license-title">
      <header>
        <div><span class="eyebrow">LICENSE</span><h2 id="license-title">许可证 / License</h2></div>
        <button class="icon-button" aria-label="关闭许可证" @click="emit('close')"><X :size="18" /></button>
      </header>
      <div class="help-content license-content" v-html="licenseHtml" />
      <footer><button class="button primary" @click="emit('close')">关闭</button></footer>
    </section>
  </div>
</template>
