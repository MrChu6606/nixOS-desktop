-- Create an autocommand group (just for organization)
local group = vim.api.nvim_create_augroup("CustomTabSettings", { clear = true })

-- Java → 4 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  group = group,
  callback = function()
    vim.opt_local.tabstop = 4      -- how many spaces a tab counts for
    vim.opt_local.shiftwidth = 4   -- indentation size
    vim.opt_local.expandtab = true -- use spaces instead of tabs
  end,
})

-- Nix → 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  group = group,
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
