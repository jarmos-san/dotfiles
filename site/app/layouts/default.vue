<!-- site/layouts/default.vue -->
<template>
  <a
    href="#main"
    class="sr-only focus:not-sr-only focus:fixed focus:left-4 focus:top-4 focus:z-50 focus:bg-panel focus:px-4 focus:py-2 focus:text-fg"
  >
    Skip to content
  </a>

  <div class="flex min-h-screen flex-col">
    <AppHeader />
    <main id="main" class="mx-auto w-full max-w-4xl flex-1 px-4 sm:px-6">
      <slot />
    </main>
    <AppFooter />
  </div>
</template>
