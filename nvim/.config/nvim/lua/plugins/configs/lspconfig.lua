local M = {}

---@diagnostic disable: different-requires

require("navigator").setup {
	transparency = 100,
	default_mapping = false,
	icons = {
		icons = false,
		code_action_icon = "",
		diagnostic_err = "",
		diagnostic_warn = "",
		diagnostic_info = "",
		diagnostic_virtual_text = "",
	},
	lsp = {
		format_on_save = true,
		disable_format_cap = {
			"sumneko_lua",
			"gopls",
			"tsserver",
			"denols",
			"pyright",
			"clangd",
			"rust_analyzer",
		},
	},
	servers = {
		"gopls",
		"denols",
		"bashls",
		"julials",
		"solargraph",
		"rust_analyzer",
		"clangd",
	},
	keymaps = {
		{
			key = "gr",
			func = "require('navigator.reference').reference()",
		},
		{ key = "gK", func = "declaration()" },
		{ key = "gd", func = "definition()" },
		{
			key = "gsy",
			func = "require('navigator.symbols').document_symbols()",
		},
		{
			key = "gW",
			func = "require('navigator.workspace').workspace_symbol()",
		},
		{
			key = "gp",
			func = "require('navigator.definition').definition_preview()",
		},
		{
			key = "K",
			func = "hover({ popup_opts = { border = single, max_width = 80 }})",
		},
		{
			key = "<leader>ca",
			mode = "n",
			func = "require('navigator.codeAction').code_action()",
		},
		{ key = "<leader>cA", mode = "v", func = "range_code_action()" },
		{
			key = "<leader>rn",
			func = "require('navigator.rename').rename()",
		},
		{
			key = "gL",
			func = "require('navigator.diagnostics').show_diagnostics()",
		},
		{
			key = "gG",
			func = "require('navigator.diagnostics').show_buf_diagnostics()",
		},
	},
}

vim.cmd [[
	hi default GHTextViewDark guifg=#e0d8f4
	hi default GHListDark guifg=#e0d8f4
	hi default GHListHl guifg=#e0d8f4 guibg=none
]]

vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { silent = true })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { silent = true })
vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<cr>", { silent = true })
vim.keymap.set("n", "<leader>lS", "<cmd>LspStop<cr>", { silent = true })

-- vim.diagnostic.config {
-- 	virtual_text = true,
-- 	signs = true,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	severity_sort = false,
-- }

-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

M.go = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			require("go.format").goimport() -- goimport + gofmt
		end,
	})
	require("go").setup()
end

return M
