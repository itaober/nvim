local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
	return
end

autopairs.setup({
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
})

-- import nvim-autopairs completion functionality safely
local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
	return
end

-- import nvim-cmp plugin safely (completions plugin)
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
