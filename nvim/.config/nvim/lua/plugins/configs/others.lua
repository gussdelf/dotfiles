local M = {}

M.bufferline = function()
	local present, bufferline = pcall(require, "bufferline")
	if present then
		require("bufferline").setup {
			options = {
				separator_style = "thin",
			},
		}
		map("n", "<leader>bj", "<cmd>BufferLineCycleNext<CR>", { silent = true })
		map("n", "<leader>bk", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
	end
end

M.colorizer = function()
	local present, colorizer = pcall(require, "colorizer")
	if present then
		require("colorizer").setup()
	end
	map("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { silent = true })
end

M.autotags = function()
	-- Autotag
	require("nvim-treesitter.configs").setup {
		autotag = {
			enable = true,
			filetypes = {
				"html",
				"javascript",
				"javascriptreact",
				"svelte",
				"vue",
			},
		},
	}
end

M.autopairs = function()
	local present1, autopairs = pcall(require, "nvim-autopairs")
	local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
	if present1 and present2 then
		autopairs.setup()

		local cmp = require "cmp"
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end
	require("nvim-autopairs").setup {}
end

M.luasnip = function()
	local present, luasnip = pcall(require, "luasnip")
	if present then
		luasnip.config.set_config {
			history = true,
			updateevents = "TextChanged,TextChangedI",
		}
		require("luasnip.loaders.from_vscode").load()
	end
end

M.hop = function()
	local present, hop = pcall(require, "hop")
	if present then
		require("hop").setup()
	end
	-- Mapping
	map("n", "F", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
	map("n", "f", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
	map("v", "F", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
	map("v", "f", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
	map("o", "F", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
	map("o", "f", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
end

M.signature = function()
	local present, lspsignature = pcall(require, "lsp_signature")
	if present then
		lspsignature.setup {
			bind = true,
			doc_lines = 0,
			floating_window = true,
			fix_pos = true,
			hint_enable = true,
			hint_scheme = "String",
			hi_parameter = "Search",
			max_height = 22,
			max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
			handler_opts = {
				border = "single", -- double, single, shadow, none
			},
			zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
			padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc
		}
	end
end

M.tsrainbow = function()
	require("nvim-treesitter.configs").setup {
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
		},
	}
end

M.comment = function()
	require("Comment").setup()
end

M.theme = function()
	require("nightfox").setup {
		fox = "nightfox", -- Which fox style should be applied
		styles = {
			keywords = "bold", -- change style of keywords to be bold
			functions = "bold,italic", -- styles can be a comma separated list
			strings = "italic",
		},
		transparent = true, -- Disable setting the background color
		inverse = {
			match_paren = true, -- Enable/Disable inverse highlighting for match parens
		},
	}
	require("nightfox").load()
	vim.cmd [[
	hi default GHTextViewDark guifg=#e0d8f4
	hi default GHListDark guifg=#e0d8f4
	hi default GHListHl guifg=#e0d8f4 guibg=#283648
	]]
end

M.navigator = function()
	require("navigator").setup {
		transparency = 100,
		default_mapping = false,
		keymaps = {
			{ key = "gr", func = "require('navigator.reference').reference()" },
			{ key = "gK", func = "declaration()" },
			{ key = "gd", func = "definition()" },
			{ key = "gsy", func = "require('navigator.symbols').document_symbols()" },
			{ key = "gW", func = "require('navigator.workspace').workspace_symbol()" },
			{ key = "gp", func = "require('navigator.definition').definition_preview()" },
			{ key = "K", func = "hover({ popup_opts = { border = single, max_width = 80 }})" },
			{ key = "<leader>ca", mode = "n", func = "require('navigator.codeAction').code_action()" },
			{ key = "<leader>cA", mode = "v", func = "range_code_action()" },
			{ key = "<leader>rn", func = "require('navigator.rename').rename()" },
			{ key = "gL", func = "require('navigator.diagnostics').show_diagnostics()" },
			{ key = "gG", func = "require('navigator.diagnostics').show_buf_diagnostics()" },
		},
	}
end

M.null_ls = function()
	require("null-ls").setup {
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.diagnostics.eslint,
			require("null-ls").builtins.completion.spell,
		},
	}
	map("n", "<C-f>", "<Cmd>lua vim.lsp.buf.formatting()<cr>", { silent = true })
	map("v", "<C-f>", "<Cmd>lua vim.lsp.buf.range_formatting()<cr>", { silent = true })
end

return M
