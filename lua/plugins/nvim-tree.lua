return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		version = "nightly", -- optional, updated every week. {see issue #1193},
		opts = {
			git = {
				ignore = false,
			},
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)
		end,
		init = function()
			-- disable netrw at the very start of your init.lua (strongly advised)
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
	},
}
