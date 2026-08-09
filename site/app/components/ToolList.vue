<!-- site/components/ToolList.vue -->
<script setup lang="ts">
defineProps<{
  groups: {
    label: string
    items: string[]
  }[]
}>()
</script>

<template>
  <dl class="grid gap-4 sm:grid-cols-2">
    <div
      v-for="group in groups"
      :key="group.label"
      class="rounded-lg border border-panel bg-bg-deep p-4"
    >
      <dt class="mb-2 text-sm font-semibold text-green">{{ group.label }}</dt>
      <dd>
        <ul class="space-y-1 text-sm text-dim">
          <li v-for="item in group.items" :key="item">{{ item }}</li>
        </ul>
      </dd>
    </div>
  </dl>
</template>
