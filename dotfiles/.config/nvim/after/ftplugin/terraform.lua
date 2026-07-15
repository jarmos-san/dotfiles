-- Set the correct comment string format for Terraform files
vim.opt.commentstring = "// %s"

-- Start the Treesitter parsing process
vim.treesitter.start()

-- Lower semantic token priority so Tree-Sitter highlights take precedence
vim.highlight.priorities.semantic_tokens = 75

-- Start the "terraform-ls" LSP server
vim.lsp.enable("terraformls", true)
