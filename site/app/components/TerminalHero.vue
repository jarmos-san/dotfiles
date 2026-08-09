<!-- site/components/TerminalHero.vue -->
<script setup lang="ts">
const {
    prompt = "❯ ",
    command = 'curl -fsSL "https://tinyurl.com/setup-dotfile" | bash -c',
    title = "jarmos — fish: ~/dotfiles",
} = defineProps<{
    prompt?: string;
    command?: string;
    title?: string;
}>();
</script>

<template>
    <div
        class="overflow-hidden rounded-lg border border-panel bg-bg-deep text-left shadow-[0_2px_48px_rgba(0,0,0,0.45)]"
    >
        <div class="flex items-center gap-3 border-b border-panel px-4 py-2.5" aria-hidden="true">
            <span class="flex gap-1.5">
                <span class="size-2.5 rounded-full bg-dim" />
                <span class="size-2.5 rounded-full bg-dim" />
                <span class="size-2.5 rounded-full bg-dim" />
            </span>
            <span class="truncate text-xs text-dim">{{ title }}</span>
        </div>

        <div class="flex items-start justify-between gap-4 px-4 py-5 sm:px-5">
            <p class="min-w-0 wrap-break-word text-sm leading-relaxed text-fg sm:text-base">
                <span class="select-none text-green" aria-hidden="true">{{ prompt }} </span>
                <span class="text-dim">curl</span>
                <span class="text-dim"> -fsSL </span>
                <span class="text-orange">"https://tinyurl.com/setup-dotfile"</span>
                <span class="text-dim"> | bash -c</span>
                <span
                    class="cursor-blink ml-1 inline-block h-4 w-2 translate-y-0.5 bg-fg"
                    aria-hidden="true"
                />
            </p>

            <CopyButton :text="command" label="Copy install command" />
        </div>
    </div>
</template>
