# Landing page (Nuxt 4)

Static landing page for the dotfiles repo, deployed to GitHub Pages at
`https://jarmos-san.github.io/dotfiles/`.

## Development

```bash
npm install
npm run dev
```

## Production build (static)

```bash
npm run generate
```

Output lands in `.output/public/`, ready to deploy to GitHub Pages.
`app.baseURL` is set to `/dotfiles/` in `nuxt.config.ts`.
