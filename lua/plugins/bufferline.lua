return {
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		},
		config = function(_, opts)
			require("bufferline").setup(opts)
		end,
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "" },
			{ "<leader>x", "<Cmd>bp <BAR> bd #<CR>", desc = "" },
		},
	},
}
