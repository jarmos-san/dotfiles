<!-- site/components/SetupGuide.vue -->
<script setup lang="ts">
interface Props {
  command?: string;
}

const cmd = 'curl -fsSL "https://dotfiles.jarmos.dev/install.py" | python';
const { command = cmd } = defineProps<Props>();
const setupId = useId();
</script>

<template>
  <div :id="setupId" class="scroll-mt-8">
    <div
      class="flex items-center justify-between gap-4 rounded-lg border border-panel bg-bg-deep px-4 py-3 sm:px-5"
    >
      <p class="min-w-0 break-words text-sm text-fg">
        <span class="select-none text-green" aria-hidden="true">$ </span>
        <span class="text-dim"> curl -fsSL </span>
        <span class="text-orange">"https://dotfiles.jarmos.dev/install.py"</span>
        <span class="text-dim"> | python</span>
      </p>

      <CopyButton :text="command" label="Copy setup command" />
    </div>

    <p class="mt-4 border-l-4 border-red bg-bg-deep px-4 py-3 text-sm leading-relaxed text-red">
      <span class="font-semibold">Reference only:</span> these configs are tuned for Jarmos's
      machine. Do not fork this repository and run the bootstrap script on your system — the author
      is not responsible for any data loss or system corruption.
    </p>
  </div>
</template>
