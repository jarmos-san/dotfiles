<!-- site/app.vue -->
<script setup lang="ts">
useSeoMeta({
  title: 'jarmos/dotfiles — Neovim, Fish, Wezterm & tmux configs',
  description:
    "Jarmos's personal dotfiles: Neovim, Fish, Wezterm, tmux, and the tools around them — tracked in git, ready to install.",
  ogType: 'website',
  ogTitle: 'jarmos/dotfiles — Neovim, Fish, Wezterm & tmux configs',
})
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
