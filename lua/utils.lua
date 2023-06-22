local M = {}

M.augroup = vim.api.nvim_create_augroup
M.autocmd = vim.api.nvim_create_autocmd
M.namespace = vim.api.nvim_create_namespace

return M
