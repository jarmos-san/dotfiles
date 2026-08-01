---@brief
---
---Configuration module for the `vue-language-server` (vue_ls) server.
---
---This setup forwards `tsserver/request` notifications emited by the
---`vue-language-server` to an active TypeScript LSP client (e.g., `vtsls`)
---
---It implements a retry mechanism to account for delayed attachment of the TypeScript
---server.

---@type vim.lsp.Config
return {
  -- `vue-language-server` requires the JS-based TypeScript API (`ts.server`),
  -- which TypeScript 7.x (native tsgo) no longer provides. The Homebrew formula
  -- auto-installs the `typescript: "*"` peer dep as TS 7.0.2, which crashes the
  -- server on the first `.vue` file:
  -- `TypeError: Cannot read properties of undefined (reading 'protocol')`.
  -- Point `--tsdk` at the pinned global TypeScript 6.x install instead (only
  -- TS <= 6 is supported; see https://github.com/mason-org/mason.nvim/issues/2108).
  cmd = {
    "vue-language-server",
    "--stdio",
    "--tsdk=" .. vim.fn.expand("~/.local/share/pnpm/global/5/node_modules/typescript/lib"),
  },
  filetypes = { "vue" },
  root_markers = { "package.json" },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    if vim.bo[bufnr].filetype == "vue" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
  on_init = function(client)
    local retries = 0

    ---@param _ lsp.ResponseError
    ---@param result any
    ---@param context lsp.HandlerContext
    local function typescriptHandler(_, result, context)
      local ts_client = vim.lsp.get_clients({ bufnr = context.bufnr, name = "ts_ls" })[1]
        or vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })[1]
        or vim.lsp.get_clients({ bufnr = context.bufnr, name = "typescript-tools" })[1]

      if not ts_client then
        if retries <= 10 then
          retries = retries + 1
          vim.defer_fn(function()
            typescriptHandler(_, result, context)
          end, 100)
        else
          vim.notify(
            "Could not find `ts_ls`, `vtsls`, or `typescript-tools` lsp client required by `vue_ls`.",
            vim.log.levels.ERROR
          )
        end
        return
      end

      local param = unpack(result)
      local id, command, payload = unpack(param)
      ts_client:exec_cmd({
        title = "vue_request_forward",
        command = "typescript.tsserverRequest",
        arguments = {
          command,
          payload,
        },
      }, { bufnr = context.bufnr }, function(_, r)
        local response_data = { { id, r and r.body } }
        if response_data == nil then
          return
        end
        client:notify("tsserver/response", response_data)
      end)
    end

    client.handlers["tsserver/request"] = typescriptHandler
  end,
}
