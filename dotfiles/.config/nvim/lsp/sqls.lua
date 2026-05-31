---@brief
---
--- The source code for the SQL LSP server can be found here:
--- https://github.com/sqls-server/sqls
---
--- The software is not distributed through HomeBrew, hence it needs to be
--- installed via `go install github.com/sqls-server/sqls@latest`. Instructions
--- for compiling Sqls from the source can be found at https://github.com/sqls-server/sqls.

---@type vim.lsp.Config
return {
  cmd = { "sqls" },
  filetypes = { "sql" },
  root_markers = { "sqls.config.yml" },
}
