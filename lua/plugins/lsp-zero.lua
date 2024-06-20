return {
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
			local lsp_zero = require('lsp-zero')
			lsp_zero.format_on_save({
				format_opts = {
					async = false,
					timeout_ms = 1000,
				},
				servers = {
					['rust_analyzer'] = { 'rust' },
					['lua_ls'] = { 'lua' },
					['clangd'] = { 'c', 'cpp' },
					['ruff_lsp'] = { 'python' },
				},
			})
			lsp_zero.on_attach(function(_, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)
		end,
	},

	{
		'L3MON4D3/LuaSnip',
		lazy = true,
		dependencies = {
			'rafamadriz/friendly-snippets',
		},
		build = 'make install_jsregexp',
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
		end,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		lazy = true,
		event = 'InsertEnter',
		dependencies = {
			{
				'L3MON4D3/LuaSnip',
				'hrsh7th/cmp-path',
			},
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local luasnip = require('luasnip')

			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<C-l>'] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { 'i', 's' }),
					['<C-h>'] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { 'i', 's' }),
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' }, -- For luasnip users.
					{ name = 'path' },
				}, {
					{ name = 'buffer' },
				})
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			-- (Optional) Configure lua language server for neovim
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
			require('lspconfig').rust_analyzer.setup {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = 'dev' },
							extraArgs = { "--profile", "rust-analyzer" },
						}
					}
				}
			}
			require('lspconfig').clangd.setup {}
			require('lspconfig').pyright.setup {
				settings = {
					pyright = {
						venvPath = '.',
						venv = '.venv',
						-- Using Ruff's import organizer
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- Ignore all files for analysis to exclusively use Ruff for linting
							ignore = { '*' },
						},
					},
				},
			}
			require('lspconfig').ruff_lsp.setup {
				init_options = {
					settings = {
						interpreter = { './.venv/bin/python' },
						-- Any extra CLI arguments for `ruff` go here.
						args = {},
					}
				}
			}
			local on_attach = function(client, bufnr)
				if client.name == 'ruff_lsp' then
					-- Disable hover in favor of Pyright
					client.server_capabilities.hoverProvider = false
				end
			end

			require 'lspconfig'.cmake.setup {}
		end
	}
}
