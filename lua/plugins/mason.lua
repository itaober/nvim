return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"graphql",
				"lua_ls",
			},
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"prettierd",
				"stylua",
				"eslint_d",
			},
		},
		config = function(_, opts)
			require("mason-null-ls").setup(opts)
		end,
	},
}
