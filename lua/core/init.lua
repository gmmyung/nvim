-- Copy yanked content to system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
-- <M-Esc> to escape terminal
vim.api.nvim_set_keymap('t', '<S-Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Show relative line number
vim.wo.relativenumber = true
vim.wo.number = true

-- Function to set tab settings for a specific filetype
local function set_tab_settings(filetype, tabwidth, expandtab)
  vim.api.nvim_exec(string.format([[
    augroup %s_settings
      autocmd!
      autocmd BufEnter *.%s setlocal tabstop=%d shiftwidth=%d %s softtabstop=%d
    augroup END
  ]], filetype, filetype, tabwidth, tabwidth, expandtab and "expandtab" or "noexpandtab", tabwidth), false)
end

set_tab_settings("lua", 2, true)
set_tab_settings("rs", 4, false)

-- Remap move between windows with <C-S-H/J/K/L>
vim.api.nvim_set_keymap('n', '<C-S-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-l>', '<C-w>l', { noremap = true, silent = true })

-- Scroll result in center
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Search result in center
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })
