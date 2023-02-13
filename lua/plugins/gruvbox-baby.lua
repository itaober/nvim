local status, gruvbox_baby = pcall(require, "gruvbox-baby")
if not status then
	print("Gruvbox baby is not found!")
	return
end

local g = vim.g

g.gruvbox_baby_background_color = "medium"
g.gruvbox_baby_function_style = "NONE"
g.gruvbox_baby_telescope_theme = 1
g.gruvbox_baby_transparent_mode = 1

vim.cmd([[colorscheme gruvbox-baby]])
