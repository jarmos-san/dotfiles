-- Start the Treesitter parsing process for HCL files
vim.treesitter.start()

-- Autocommand to format the contents of Packer templates on save
vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format the contents of the Packer template.",
  pattern = { "*.pkr.hcl", "*.pkrvars.hcl" },
  group = vim.api.nvim_create_augroup("format_on_save", { clear = true }),
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd("silent keepjumps %!packer fmt -")
    vim.fn.winrestview(view)
  end,
})
