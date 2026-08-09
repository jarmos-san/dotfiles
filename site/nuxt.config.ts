import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
    compatibilityDate: "2025-07-15",
    devtools: { enabled: true },
    modules: ["@nuxtjs/seo", "@nuxt/fonts", "@vueuse/nuxt"],
    css: ["~/assets/css/main.css"],
    site: {
        url: "https://dotfiles.jarmos.dev",
        name: "jarmos/dotfiles",
        description:
            "Jarmos's personal dotfiles: Neovim, Fish, Wezterm, tmux, and the tools around them — tracked in git, ready to install.",
        defaultLocale: "en",
    },
    ogImage: { enabled: false },
    fonts: {
        families: [{ name: "Cascadia Code", provider: "google" }],
    },
    nitro: {
        preset: "static",
    },
    vite: {
        plugins: [tailwindcss()],
    },
});
