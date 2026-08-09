<!-- site/app.vue -->
<script setup lang="ts">
const siteUrl = 'https://dotfiles.jarmos.dev/'

useSeoMeta({
  title: 'jarmos/dotfiles — a development environment, versioned',
  description:
    "Jarmos's personal dotfiles: Neovim, Fish, Wezterm, tmux, and the tools around them — tracked in git, ready to install.",
  ogType: 'website',
  ogSiteName: 'jarmos/dotfiles',
  ogTitle: 'jarmos/dotfiles — a development environment, versioned',
  ogDescription:
    "Jarmos's personal dotfiles: Neovim, Fish, Wezterm, tmux, and the tools around them — tracked in git, ready to install.",
  ogUrl: siteUrl,
  robots: 'index, follow',
})

useHead({
  htmlAttrs: { lang: 'en' },
  link: [{ rel: 'canonical', href: siteUrl }],
  script: [
    {
      type: 'application/ld+json',
      innerHTML: JSON.stringify({
        '@context': 'https://schema.org',
        '@type': 'WebSite',
        name: 'jarmos/dotfiles',
        url: siteUrl,
        description:
          "Jarmos's personal dotfiles: Neovim, Fish, Wezterm, tmux, and the tools around them.",
      }),
    },
  ],
})
</script>

<template>
  <NuxtLayout>
    <NuxtPage />
  </NuxtLayout>
</template>
