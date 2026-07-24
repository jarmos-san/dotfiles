-- Module for configuring the "conform" plugin for formatting using LSP

return {
  "stevearc/conform.nvim",
  event = { "LspAttach", "BufReadPost", "BufNewFile" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
    },
    format_on_save = function(_)
      return {
        timeout_ms = 10000,
        lsp_fallback = true,
      }
    end,
  },
  config = function(_, opts)
    local conform = require("conform")

    -- Setup "conform.nvim" to work
    conform.setup(opts)
  end,
}
