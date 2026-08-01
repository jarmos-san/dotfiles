-- Enable and start Treesitter parsing
vim.treesitter.start()

-- Soft-wrap long CSS lines at the window edge. A native 'wrapcolumn' option to
-- wrap at a fixed column does not exist in Neovim 0.12.x yet.
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
