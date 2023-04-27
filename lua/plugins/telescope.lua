return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = require("telescope.actions").move_selection_previous,
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-q>"] = require("telescope.actions").send_selected_to_qflist
							+ require("telescope.actions").open_qflist,
					},
				},
			},
		},
		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},
}
