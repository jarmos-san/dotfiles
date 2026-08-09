<!-- site/components/CopyButton.vue -->
<script setup lang="ts">
const props = defineProps<{
  text: string
  label: string
}>()

const copied = ref(false)
let timer: ReturnType<typeof setTimeout> | undefined

async function copy() {
  if (!navigator.clipboard) {
    return
  }
  try {
    await navigator.clipboard.writeText(props.text)
  } catch {
    return
  }
  copied.value = true
  timer && clearTimeout(timer)
  timer = setTimeout(() => {
    copied.value = false
  }, 2000)
}

onBeforeUnmount(() => {
  timer && clearTimeout(timer)
})
</script>

<template>
  <button
    type="button"
    class="shrink-0 rounded-md border border-panel bg-panel px-3 py-1.5 text-xs text-fg transition-colors hover:border-green hover:text-green"
    :aria-label="copied ? `${label} (copied)` : label"
    @click="copy"
  >
    {{ copied ? 'copied ✓' : 'copy' }}
  </button>
  <span v-if="copied" class="sr-only" role="status" aria-live="polite">
    Copied
  </span>
</template>
