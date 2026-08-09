<!-- site/components/CopyButton.vue -->
<script setup lang="ts">
import { useClipboard } from '@vueuse/core'

const { text, label } = defineProps<{
  text: string
  label: string
}>()

const { copy, copied } = useClipboard({ copiedDuring: 2000 })
</script>

<template>
  <button
    type="button"
    class="shrink-0 rounded-md border border-panel bg-panel px-3 py-1.5 text-xs text-fg transition-colors hover:border-green hover:text-green"
    :aria-label="copied ? `${label} (copied)` : label"
    @click="copy(text)"
  >
    {{ copied ? 'copied ✓' : 'copy' }}
  </button>
  <span v-if="copied" class="sr-only" role="status" aria-live="polite">
    Copied
  </span>
</template>
