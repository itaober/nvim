return {
	"MunifTanjim/prettier.nvim",
	opts = {
		bin = "prettierd",
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"html",
			"css",
			"scss",
			"less",
		},
	},
	config = function(_, opts)
		require("prettier").setup(opts)
	end,
}
