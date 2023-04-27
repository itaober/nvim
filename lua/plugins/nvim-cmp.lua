return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "L3MON4D3/LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "onsails/lspkind.nvim" },
			{ "windwp/nvim-autopairs" },
		},
		opts = {
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			mapping = require("cmp").mapping.preset.insert({
				["<C-u>"] = require("cmp").mapping.scroll_docs(-5),
				["<C-d>"] = require("cmp").mapping.scroll_docs(5),
				["<C-Space>"] = require("cmp").mapping.complete(), -- show completion suggestions
				["<C-c>"] = require("cmp").mapping.abort(), -- close completion window
				["<CR>"] = require("cmp").mapping.confirm({ select = true }),
			}),
			sources = require("cmp").config.sources({
				{ name = "nvim_lsp" }, -- lsp
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
			formatting = {
				format = require("lspkind").cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		},
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
		init = function()
			-- load friendly-snippets
			require("luasnip/loaders/from_vscode").lazy_load()
			require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
		end,
	},
}
