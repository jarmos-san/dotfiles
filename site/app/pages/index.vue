<!-- site/pages/index.vue -->
<script setup lang="ts">
const toolGroups = [
  {
    label: 'Editor',
    items: ['Neovim — Lua config with lazy.nvim', 'LSP for many languages'],
  },
  {
    label: 'Shell',
    items: ['Fish — custom prompt, abbreviations, functions'],
  },
  {
    label: 'Terminal',
    items: ['Wezterm — Cascadia Code Nerd Font, transparency'],
  },
  {
    label: 'Multiplexer',
    items: ['Tmux — vim keybindings, gruvbox statusline'],
  },
  {
    label: 'Tools',
    items: ['bat, eza, btop, glow', 'gh, ripgrep, jq, and more'],
  },
  {
    label: 'Python',
    items: ['uv, ruff, mypy', 'pip with require-virtualenv'],
  },
  {
    label: 'Go',
    items: ['gotestsum, golangci-lint, gopls'],
  },
  {
    label: 'Packages',
    items: ['Homebrew Linux Brewfile', 'pre-commit hooks'],
  },
]
</script>

<template>
  <section class="py-16 sm:py-24">
    <p class="text-sm text-orange" aria-hidden="true">❯ ~/jarmos</p>
    <h1 class="mt-4 max-w-2xl text-4xl leading-tight text-fg sm:text-5xl">
      My <span class="text-green">dotfiles</span>, in git.
    </h1>
    <p class="mt-6 max-w-xl text-base leading-relaxed text-dim">
      Neovim, Fish, Wezterm, tmux — the tools I code with every day, ready to
      install.
    </p>

    <div class="mt-10 lg:w-fit">
      <TerminalHero />
    </div>
  </section>

  <section class="py-16 sm:py-24">
    <SectionHeading
      id="whats-inside"
      eyebrow="what's inside"
      title="The tools that ship with it"
    />
    <ToolList :groups="toolGroups" />
  </section>

  <section class="py-16 sm:py-24">
    <SectionHeading
      id="setup"
      eyebrow="setup"
      title="Install it"
    />
    <SetupGuide />
  </section>
</template>
