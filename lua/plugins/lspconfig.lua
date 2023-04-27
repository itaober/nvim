local keymap = vim.keymap

-- enable keybinds for available lsp server
local on_attach = function(client, bufnr)
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	-- set keybinds
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostics_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostics_jump_next<CR>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
	end
end

return {
	{ "glepnir/lspsaga.nvim", branch = "main" },
	{
		"jose-elias-alvarez/typescript.nvim",
		dependencies = { { "hrsh7th/cmp-nvim-lsp" } },
		opts = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			on_attach = on_attach,
		},
		config = function(_, opts)
			require("typescript").setup(opts)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { { "hrsh7th/cmp-nvim-lsp" } },
		config = function()
			local lspconfig = require("lspconfig")
			-- used to enable autocompletion
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			lspconfig["html"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["cssls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					-- custom settings for lua
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							-- make language server aware of runtime files
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			})
		end,
	},
}
