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

## SEO

[`@nuxtjs/seo`](https://nuxtseo.com/) provides sitemap, robots, schema.org
JSON-LD, and canonical URLs, all driven by the `site` block in
`nuxt.config.ts`. Generated `sitemap.xml` and `robots.txt` are written at
build time — do not commit static copies under `public/`.
