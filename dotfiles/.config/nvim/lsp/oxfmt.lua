--- @brief
---
--- https://github.com/oxc-project/oxc
--- https://oxc.rs/docs/guide/usage/formatter.html
---
--- `oxfmt` is a Prettier-compatible code formatter that supports multiple languages
--- including JavaScript, TypeScript, JSON, YAML, HTML, CSS, Markdown, and more.
--- It can be installed via `npm`:

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local cmd = "oxfmt"

    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)

      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end

    return vim.lsp.rpc.start({ cmd, "--lsp" }, dispatchers)
  end,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "toml",
    "json",
    "jsonc",
    "json5",
    "yaml",
    "html",
    "vue",
    "css",
    "scss",
    "graphql",
    "markdown",
  },
  workspace_required = true,
  root_markers = { ".oxfmtrc.json", ".oxfmtrc.jsonc", "oxfmt.config.ts", "package.json", ".git" },
}
