return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons',
	},
	enabled = true,
	opts = {
		options = {
			icons_enabled = true,
			theme = 'gruvbox',
			component_separators = { left = '|', right = '|' },
			section_separators = { left = '', right = '' },
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
		},
		sections = {
			lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
			lualine_b = { 'branch', 'tag', 'diff', 'diagnostics' },
			lualine_c = { 'filename' },
			lualine_x = {
				{ 'encoding', fmt = function(str) return str:upper(str) end },
				{
					'fileformat',
					icons_enabled = false,
					fmt = function(str) return str:upper(str) end
				},
				'filetype',
			},
			lualine_y = { 'progress' },
			lualine_z = { 'location' }
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}
}
