---@diagnostic disable: different-requires
local M = {}

M.lualine = function()
	require("lualine").setup {
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = {
				"dashboard",
				"startify",
				"NvimTree",
				"packer",
			},
		},
		extensions = { "toggleterm" },
	}
end

M.bufferline = function()
	require("bufferline").setup {
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
	}
end

M.colorizer = function()
	require("colorizer").setup()
	vim.keymap.set(
		"n",
		"<leader>ct",
		"<cmd>ColorizerToggle<cr>",
		{ silent = true }
	)
end

M.autopairs = function()
	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
	local cmp = require "cmp"
	cmp.event:on(
		"confirm_done",
		cmp_autopairs.on_confirm_done { map_char = { tex = "" } }
	)

	cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
	require("nvim-autopairs").setup()
end

M.luasnip = function()
	local luasnip = require "luasnip"
	luasnip.config.set_config {
		history = true,
		updateevents = "TextChanged,TextChangedI",
	}
	require("luasnip.loaders.from_vscode").load()
end

M.hop = function()
	require("hop").setup()
	-- Mapping
	vim.keymap.set({ "n", "v", "o" }, "F", function()
		require("hop").hint_lines()
	end, { silent = true })
	vim.keymap.set({ "n", "v", "o" }, "f", function()
		require("hop").hint_words()
	end, { silent = true })
end

M.gomove = function()
	require("gomove").setup {
		map_defaults = true,
		reindent = true,
		undojoin = true,
		move_past_end_col = false,
	}
end

M.signature = function()
	local lspsignature = require "lsp_signature"
	lspsignature.setup {
		bind = true,
		doc_lines = 0,
		floating_window = true,
		fix_pos = true,
		hint_enable = true,
		hint_scheme = "String",
		hi_parameter = "Search",
		max_height = 22,
		max_width = 120,
		handler_opts = {
			border = "single",
		},
		zindex = 200,
		padding = "",
	}
end

M.navigator = function()
	require("navigator").setup {
		transparency = 100,
		default_mapping = false,
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
		icons = {
			icons = false,
			code_action_icon = "💡",
			diagnostic_err = "🚨",
		},
		lsp = {
			disable_format_cap = {
				"sumneko_lua",
				"rust-analyzer",
				"gopls",
				"tsserver",
				"denols",
				"pyright",
			}, -- For avoiding conflicts with null-ls
		},
	}
end

M.null_ls = function()
	require("null-ls").setup {
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.formatting.rustfmt,
			require("null-ls").builtins.formatting.gofmt,
			require("null-ls").builtins.formatting.black,
			require("null-ls").builtins.formatting.deno_fmt.with {
				extra_args = function(params)
					return {
						"--options-use-tabs",
					}
				end,
			},
		},
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.api.nvim_create_augroup { name = "lspFormatGroup" }
				vim.api.nvim_create_autocmd {
					event = "BufWritePre",
					group = "lspFormatGroup",
					pattern = "*",
					callback = function()
						vim.lsp.buf.formatting_sync()
					end,
				}
			end
		end,
	}
	vim.keymap.set(
		"n",
		"<C-f>",
		"<Cmd>lua vim.lsp.buf.formatting()<cr>",
		{ silent = true }
	)
	vim.keymap.set(
		"v",
		"<C-f>",
		"<Cmd>lua vim.lsp.buf.range_formatting()<cr>",
		{ silent = true }
	)
end

M.trouble = function()
	require("trouble").setup {}
	vim.keymap.set(
		"n",
		"<leader>to",
		"<cmd>TroubleToggle<cr>",
		{ silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>td",
		"<cmd>TroubleToggle document_diagnostics<cr>",
		{ silent = true }
	)
	vim.keymap.set(
		"n",
		"<leader>tw",
		"<cmd>TroubleToggle workspace_diagnostics<cr>",
		{ silent = true }
	)
end

M.harpoon = function()
	vim.keymap.set("n", "<leader>ha", function()
		require("harpoon.mark").add_file()
	end, { silent = true })

	vim.keymap.set("n", "<leader>hh", function()
		require("harpoon.ui").toggle_quick_menu()
	end, { silent = true })
end

return M
