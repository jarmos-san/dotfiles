# Landing page (Nuxt 4)

Static landing page for the dotfiles repo, deployed to GitHub Pages at
`https://dotfiles.jarmos.dev/`.

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
The site is served at the custom domain root, so no `app.baseURL` is set
(defaults to `/`).
