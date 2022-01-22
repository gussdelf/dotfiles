local nvim_lsp = require "lspconfig"
--local cmp = require 'cmp'
--local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

nvim_lsp.sumneko_lua.setup {
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach()
	end,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			workspace = {
				library = {
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
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

local servers = { "pyright", "clangd", "gopls", "tsserver", "rust_analyzer", "texlab", "bashls", "html", "cssls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end
