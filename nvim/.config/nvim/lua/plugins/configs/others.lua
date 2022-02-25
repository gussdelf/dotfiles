local M = {}

M.lualine = function()
	require("lualine").setup {
		options = {
			theme = "auto",
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			disabled_filetypes = { "dashboard", "startify", "NvimTree", "packer" },
		},
		extensions = { "toggleterm" },
	}
end

M.bufferline = function()
	require("bufferline").setup { offsets = { { filetype = "NvimTree", text = "File Explorer" } } }
end

M.colorizer = function()
	require("colorizer").setup()
	vim.keymap.set("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { silent = true })
end

M.autopairs = function()
	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
	local cmp = require "cmp"
	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

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

M.setTheme = function()
	vim.g.gruvbox_material_palette = "original"
	vim.g.gruvbox_material_background = "hard"
	vim.g.gruvbox_material_better_performance = true
	vim.g.gruvbox_material_sign_column_background = "none"
	vim.g.gruvbox_material_transparent_background = true
	vim.g.gruvbox_material_cursor = "red"

	vim.cmd [[colorscheme gruvbox-material]]
	vim.cmd [[
	hi default GHTextViewDark guifg=#e0d8f4
	hi default GHListDark guifg=#e0d8f4
	hi default GHListHl guifg=#e0d8f4 guibg=#282828
	hi SpecialKey guifg=#cc241d
	hi SpecialKeyWin guifg=#3c3836
	" hi SignColumn guibg=#1d2021
	set winhighlight=SpecialKey:SpecialKeyWin
	" hi LineNr guibg=#282828
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
		lsp = {
			disable_format_cap = { "sumneko_lua" }, -- For avoiding conflicts with null-ls
		},
	}
	-- vim.keymap.set("n", "<C-o>", "<cmd>bw<cr>", { silent = true })
end

M.null_ls = function()
	require("null-ls").setup {
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.formatting.prettierd,
		},
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.cmd [[
			augroup LspFormatting
			autocmd! * <buffer>
			autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
			augroup END
			]]
			end
		end,
	}
	vim.keymap.set("n", "<C-f>", "<Cmd>lua vim.lsp.buf.formatting()<cr>", { silent = true })
	vim.keymap.set("v", "<C-f>", "<Cmd>lua vim.lsp.buf.range_formatting()<cr>", { silent = true })
end

M.matchup = function()
	require("nvim-treesitter.configs").setup {
		matchup = {
			enable = true, -- mandatory, false will disable the whole extension
		},
	}
end

M.neoformat = function()
	vim.keymap.set("n", "<C-f>", "<Cmd>Neoformat<cr>", { silent = true })
	vim.keymap.set("v", "<C-f>", "<Cmd>Neoformat<cr>", { silent = true })
end

M.blankline = function()
	require("indent_blankline").setup {
		show_current_context = false,
		show_current_context_start = false,
	}
end

M.trouble = function()
	require("trouble").setup {}
	vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true })
	vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
	vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
end

M.todo = function()
	require("todo-comments").setup {
		search = {
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		},
	}
	vim.keymap.set("n", "<leader>to", "<cmd>TodoTrouble<cr>", { silent = true })
end

M.harpoon = function()
	vim.keymap.set("n", "<leader>ha", function()
		require("harpoon.mark").add_file()
	end, { silent = true })

	vim.keymap.set("n", "<leader>hh", function()
		require("harpoon.ui").toggle_quick_menu()
	end, { silent = true })
end

M.gitsigns = function()
	require("gitsigns").setup {
		signs = {
			add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			topdelete = {
				hl = "GitSignsDelete",
				text = "‾",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
		numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
		linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
		word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		max_file_length = 40000,
		preview_config = {
			-- Options passed to nvim_open_win
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
		yadm = {
			enable = false,
		},
	}
end

return M
