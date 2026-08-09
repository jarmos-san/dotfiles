<!-- site/components/SectionHeading.vue -->
<script setup lang="ts">
defineProps<{
  eyebrow: string
  title: string
  id?: string
}>()
</script>

<template>
  <div class="mb-8">
    <p class="text-sm text-orange" aria-hidden="true">❯ {{ eyebrow }}</p>
    <h2 :id="id" class="mt-2 text-2xl text-fg">{{ title }}</h2>
  </div>
</template>
