-- some basic plugins
return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	{
		"numToStr/Comment.nvim",
    config = function ()
      require('Comment').setup()
    end
	},
	{
		"folke/todo-comments.nvim",
    config = function ()
      require('todo-comments').setup()
    end,
	},
	{
		"lewis6991/gitsigns.nvim",
    config = function ()
      require('gitsigns').setup()
    end,
	},
	{
		"folke/zen-mode.nvim",
    config = function ()
      require('zen-mode').setup()
    end
	},
	{ "tpope/vim-surround" },
}
