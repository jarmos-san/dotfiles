<!-- site/components/AppFooter.vue -->
<template>
  <footer class="mt-24 border-t border-panel bg-bg-deep">
    <div
      class="mx-auto flex w-full max-w-4xl flex-wrap items-center justify-between gap-2 px-4 py-6 text-xs text-dim sm:px-6"
    >
      <p>© {{ new Date().getFullYear() }} Jarmos · MIT License</p>
      <ul class="flex gap-4">
        <li>
          <a
            href="https://github.com/Jarmos-san/dotfiles"
            rel="noopener noreferrer"
            target="_blank"
            class="text-blue underline decoration-dotted underline-offset-4 hover:text-fg"
          >
            source
          </a>
        </li>
        <li>
          <a
            href="https://github.com/Jarmos-san/dotfiles/blob/main/LICENSE"
            rel="noopener noreferrer"
            target="_blank"
            class="text-blue underline decoration-dotted underline-offset-4 hover:text-fg"
          >
            license
          </a>
        </li>
      </ul>
    </div>
  </footer>
</template>
