local nvim_lsp = require "lspconfig"

local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

nvim_lsp.sumneko_lua.setup {
	on_attach = on_attach,
	function(client, bufnr)
		require("lsp_signature").on_attach()
	end,
	settings = {
		Lua = {
			diagnostics = {
				enable = true,
				globals = {
					"vim",
					"describe",
					"it",
					"before_each",
					"after_each",
					"awesome",
					"theme",
					"client",
					"P",
				},
			},
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath "config" .. "/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

nvim_lsp.rust_analyzer.setup {
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			cargo = {
				loadOutDirsFromCheck = true,
			},
			procMacro = {
				enable = true,
			},
		},
	},
}

local servers = { "pyright", "clangd", "gopls", "tsserver", "rust_analyzer", "texlab", "bashls", "html", "cssls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end

vim.diagnostic.config {
	virtual_text = true,
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

vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { silent = true })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>", { silent = true })
vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<cr>", { silent = true })
vim.keymap.set("n", "<leader>lS", "<cmd>LspStop<cr>", { silent = true })
