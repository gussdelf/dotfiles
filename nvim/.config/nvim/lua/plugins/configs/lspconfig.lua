local nvim_lsp = require "lspconfig"
--local cmp = require 'cmp'
--local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local on_attach = function(client, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { silent = true })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true })
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true })
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { silent = true })
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { silent = true })
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true })
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { silent = true })
map("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true })
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true })
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", { silent = true })
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { silent = true })
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

local servers = { "pyright", "clangd", "gopls", "tsserver", "rust_analyzer", "texlab", "bashls", "html", "cssls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
	}
end
