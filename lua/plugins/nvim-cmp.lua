-- lua/plugins/cmp.lua

return {
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require('luasnip').lsp_expand(args.body)
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
			})

			-- Cmdline setup
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				}
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }
				}, {
					{ name = "cmdline" }
				}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})

			-- -- LSP capabilities setup
			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- -- Replace <YOUR_LSP_SERVER> with your actual LSP server(s)
			-- require("lspconfig")["lua_ls"].setup {
			-- 	capabilities = capabilities
			-- }
		end,
	},
}
