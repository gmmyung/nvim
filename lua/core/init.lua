vim.opt.termguicolors = true

-- Copy yanked content to system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
-- <M-Esc> to escape terminal
vim.api.nvim_set_keymap('t', '<M-Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
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
