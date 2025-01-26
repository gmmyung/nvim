return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = true,
	opts = {},
	lazy = false,
	keys = {
		{
			']t',
			function()
				require('todo-comments').jump_next()
			end,
			mode = 'n',
			desc = 'Next todo comment',
		},
		{
			'[t',
			function()
				require('todo-comments').jump_prev()
			end,
			mode = 'n',
			desc = 'Prev todo comment'
		},
		{
			'<Leader>T',
			'<cmd>TodoTelescope<cr>',
			mode = 'n',
			desc = 'Telescope todo comments'
		},
	}
}
