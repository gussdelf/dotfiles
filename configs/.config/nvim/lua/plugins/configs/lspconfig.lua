---@diagnostic disable: different-requires
local M = {}

local lspconfig = require "lspconfig"

local function on_attach(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
	-- keymaps(bufnr)
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local servers = {
	"pyright",
	"rust_analyzer",
	"tsserver",
	"clangd",
	"gopls",
	"sumneko_lua",
	"julials",
	"bashls",
	"jdtls",
	"vimls",
}
for _, lsp in pairs(servers) do
	---@diagnostic disable-next-line: different-requires
	lspconfig[lsp].setup {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	}
end

vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { silent = true })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { silent = true })
vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<cr>", { silent = true })
vim.keymap.set("n", "<leader>lS", "<cmd>LspStop<cr>", { silent = true })

vim.diagnostic.config {
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

M.navigator = function()
	require("navigator").setup {
		debug = false,
		width = 0.75,
		height = 0.3,
		preview_height = 0.35,
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		default_mapping = false,
		keymaps = {
			{ key = "gr", func = "require('navigator.reference').async_ref()" },
			{ key = "gsy", func = "require('navigator.symbols').document_symbols()" },
			{ key = "gd", func = "require('navigator.definition').definition()" },
			{ key = "gD", func = "declaration({ border = 'rounded', max_width = 80 })" },
			{ key = "gp", func = "require('navigator.definition').definition_preview()" },
			{ key = "<leader>rn", func = "require('navigator.rename').rename()" },
			{ key = "gi", func = "implementation()" },
			{ key = "<leader>D", func = "type_definition()" },
			{ key = "gL", func = "require('navigator.diagnostics').show_diagnostics()" },
			{ key = "gG", func = "require('navigator.diagnostics').show_buf_diagnostics()" },
			{ key = "<Space>ca", mode = "n", func = "require('navigator.codeAction').code_action()" },
			{ key = "<Space>cA", mode = "v", func = "range_code_action()" },
			{ key = "K", func = "hover({ popup_opts = { border = single, max_width = 80 }})" },
			{ key = "<leader>lf", func = "formatting()", mode = "n" },
			{ key = "<leader>lf", func = "range_formatting()", mode = "v" },
		},
		transparency = 100,
		lsp = {
			disable_format_cap = servers,
		},
	}
end

M.go = function()
	vim.api.nvim_create_autocmd("BufWritePre", {
		pattern = "*.go",
		callback = function()
			require("go.format").goimport() -- goimport + gofmt
		end,
	})
	require("go").setup()
end

M.rust = function()
	require("rust-tools").setup {}
end

return M
