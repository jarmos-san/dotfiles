--- @brief
---
--- https://github.com/oxc-project/oxc
--- https://oxc.rs/docs/guide/usage/linter.html
---
--- `oxlint` is a linter for JavaScript / TypeScript supporting over 500 rules
--- from ESLint and its popular plugins. It also supports linting framework
--- files (Vue, Svelte, Astro) by analyzing their <script> blocks.

--- Check any project-level oxlint config for a mention of "typescript",
--- used to decide whether to auto-enable type-aware linting.
---@param root_dir string
---@return boolean
local oxlint_conf_mentions_typescript = function(root_dir)
  local fnames = { ".oxlintrc.json", "oxlintrc.jsonc", "oxlint.config.ts" }

  for _, filename in ipairs(fnames) do
    local fn = vim.fs.joinpath(root_dir, filename)
    local f = io.open(fn)

    if f then
      for line in f:lines() do
        if line:find("typescript") then
          f:close()
          return true
        end
      end
      f:close()
    end
  end

  return false
end

---@type vim.lsp.Config
return {
  --- The server command: prefer a local node_modules/.bin/oxlint over the globally-installed one.
  cmd = function(dispatchers, config)
    local cmd = "oxlint"

    if (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)

      if vim.fn.executable(local_cmd) == 1 then
        cmd = local_cmd
      end
    end

    return vim.lsp.rpc.start({ cmd, "--lsp" }, dispatchers)
  end,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte", "astro" },
  root_markers = { ".oxlintrc.json", "oxlintrc.jsonc", "oxlint.config.ts", "package.json", ".git" },
  workspace_required = true,

  --- Register `:LspOxlintFixAll` to apply oxlint's automatic fixes in the current buffer.
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "LspOxlintFixAll", function()
      client:exec_cmd({
        title = "Apply Oxlint automatic fixes",
        command = "oxc.fixAll",
        arguments = {
          { uri = vim.uri_from_bufnr(bufnr) },
        },
      })
    end, { desc = "Apply Oxlint automatic fixes" })
  end,
  settings = {
    --- When true, oxlint ignores per-directory config files and uses only the root config.
    disableNestedConfig = true,
  },

  --- Auto-enable type-aware linting if tsgolint is available and the project config mentions TypeScript.
  before_init = function(init_params, config)
    local cmd = "tsgolint"
    local settings = config.settings or {}
    local has_tsgolint = vim.fn.executable(cmd) == 1

    if not has_tsgolint and (config or {}).root_dir then
      local local_cmd = vim.fs.joinpath(config.root_dir, "node_modules/.bin", cmd)
      has_tsgolint = vim.fn.executable(local_cmd) == 1
    end

    if settings.typeAware == nil and has_tsgolint then
      local ok, res = pcall(oxlint_conf_mentions_typescript, config.root_dir)

      if ok and res then
        settings = vim.tbl_extend("force", settings, { typeAware = true })
      end
    end

    local init_options = config.init_options or {}
    init_options.settings = vim.tbl_extend("force", init_options.settings or {} --[[@as table]], settings)

    init_params.initializationOptions = init_options
  end,
}
