local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(current_client, bufnr)
	if current_client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
				vim.lsp.buf.format({
					filter = function(client)
						-- only use null-ls for formatting instead of lsp server
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = {
			sources = {
				require("null-ls").builtins.formatting.prettier,
				require("null-ls").builtins.formatting.stylua,
				require("null-ls").builtins.formatting.eslint_d,
				require("null-ls").builtins.diagnostics.eslint_d,
				require("null-ls").builtins.completion.spell,
			},
			-- configure format on save
			on_attach = on_attach,
		},
		config = function(_, opts)
			require("null-ls").setup(opts)
		end,
	},
}
