vim.opt.termguicolors = true

-- Copy yanked content to system clipboard
vim.api.nvim_set_option("clipboard","unnamed")
-- <M-Esc> to escape terminal
vim.api.nvim_set_keymap('t', '<M-Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Show relative line number
vim.wo.relativenumber = true
vim.wo.number = true
