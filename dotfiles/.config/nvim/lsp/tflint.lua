---@brief
---
---https://github.com/terraform-linters/tflint
---
---A pluggable Terraform linter that can act as an LSP server.

---@type vim.lsp.Config
return {
  cmd = { "tflint", "--langserver" },
  filetypes = { "terraform" },
  root_markers = { ".terraform", ".git", ".tflint.hcl" },
}
