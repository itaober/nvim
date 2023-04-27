return {
	{
		"windwp/nvim-autopairs",
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
			disable_filetype = {
				"TelescopePrompt",
				"vim",
			},
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},
}
