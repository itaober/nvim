vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymaps
keymap.set("i", "jj", "<ESC>", { desc = "custom esc insert mode" })
keymap.set("n", "<C-s>", "<cmd>w<CR>", { desc = "save file" })
keymap.set("n", "<C-d>", "10j", { desc = "move down 10 line" })
keymap.set("n", "<C-u>", "10k", { desc = "move up 10 line" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "remove highlight" })
keymap.set("n", "x", '"_x', { desc = "delete a character but not copy" })
-- keymap.set("n", "p", '"0p')
-- keymap.set("v", "p", '"0p')

-- split window
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split window equal width" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close current split window" })

-- split window move
keymap.set("n", "<C-h>", "<C-w>h", { desc = "to left split window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "to bottom split window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "to top split window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "to right split window" })

-- nvim-tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "toggle nvim tree" })

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "find files in current working directory" })
vim.keymap.set(
	"n",
	"<leader>fg",
	"<cmd>Telescope live_grep<CR>",
	{ desc = "search string in current working directory" }
)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "" })
