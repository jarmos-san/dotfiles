import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
    compatibilityDate: "2025-07-15",
    devtools: { enabled: true },
    modules: ["@nuxt/fonts"],
    css: ["~/assets/css/main.css"],
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
