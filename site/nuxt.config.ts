import tailwindcss from "@tailwindcss/vite";

export default defineNuxtConfig({
    compatibilityDate: "2025-07-15",
    devtools: { enabled: true },
    modules: ["@nuxt/fonts"],
    css: ["~/assets/css/main.css"],
    app: {
        baseURL: process.env.NODE_ENV === "produuction" ? "/dotfiles/" : "/",
    },
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
