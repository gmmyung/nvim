-- Copy yanked content to system clipboard
vim.api.nvim_set_option_value("clipboard", "unnamedplus", { scope = "global" })
-- <M-Esc> to escape terminal
vim.api.nvim_set_keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
-- Show relative line number
vim.wo.relativenumber = true
vim.wo.number = true

-- Disable termsync
vim.opt.termsync = false

-- Highlight area on yank
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Enable osc52
vim.g.clipboard = {
	name = 'OSC 52',
	copy = {
		['+'] = require('vim.ui.clipboard.osc52').copy('+'),
		['*'] = require('vim.ui.clipboard.osc52').copy('*'),
	},
	paste = {
		['+'] = require('vim.ui.clipboard.osc52').paste('+'),
		['*'] = require('vim.ui.clipboard.osc52').paste('*'),
	},
}

-- Function to set tab settings for a specific filetype
local function set_tab_settings(filetype, tabwidth, expandtab)
	vim.api.nvim_exec2(string.format([[
     augroup %s_settings
       autocmd!
       autocmd BufEnter *.%s setlocal tabstop=%d shiftwidth=%d %s softtabstop=%d
     augroup END
   ]], filetype, filetype, tabwidth, tabwidth, expandtab and "expandtab" or "noexpandtab", tabwidth), { output = false })
end

set_tab_settings('lua', 2, false)
set_tab_settings('rs', 4, false)
set_tab_settings('md', 2, true)

-- Remap move between windows with <C-S-H/J/K/L>
vim.api.nvim_set_keymap('n', '<C-S-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-l>', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

-- Remap window resize with <C-S-o/p/u/i>
vim.api.nvim_set_keymap('n', '<C-S-u>', '<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-p>', '<C-w>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-i>', '<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-o>', '<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-u>', '<C-\\><C-n><C-w><i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-p>', '<C-\\><C-n><C-w>>i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-i>', '<C-\\><C-n><C-w>+i', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-S-o>', '<C-\\><C-n><C-w>-i', { noremap = true, silent = true })


-- Scroll result in center
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Search result in center
vim.api.nvim_set_keymap('n', 'n', 'nzz', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'N', 'Nzz', { noremap = true, silent = true })

-- Disable sign column in terminal
-- Terminal
vim.api.nvim_create_autocmd({ "TermOpen", "TermEnter", "BufEnter" }, {
	pattern = { "term://*" },
	callback = function()
		vim.wo.relativenumber = false
		vim.wo.number         = false
		vim.o.signcolumn      = "no"
		vim.cmd([[ startinsert ]])
	end,
})
