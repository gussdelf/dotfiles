---@diagnostic disable: different-requires
require("telescope").setup {
	defaults = {
		mappings = {
			n = {
				["<C-t>"] = require("telescope.actions.layout").toggle_preview,
			},
			i = {
				["<C-t>"] = require("telescope.actions.layout").toggle_preview,
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
			},
		},
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		file_ignore_patterns = { "node_modules", ".git" },
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "flex",
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
		},
		current_buffer_fuzzy_find = {
			previewer = false,
			width = 0.8,
			prompt_title = false,
			hidden = true,
			disable_devicons = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
}

local minimal = function()
	return require("telescope.themes").get_dropdown {
		borderchars = {
			{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
			preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
		},
		path_display = { "truncate" },
		prompt_prefix = "> ",
		selection_caret = "> ",
		width = 0.8,
		previewer = false,
		prompt_title = false,
		hidden = true,
		disable_devicons = true,
		winblend = 0,
	}
end

require("telescope").load_extension "fzf"
require("telescope").load_extension "zoxide"

vim.keymap.set("n", "<leader>te", function()
	require("telescope.builtin").builtin(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>fp", function()
	require("telescope.builtin").git_files(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>ft", function()
	require("telescope.builtin").filetypes(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>j", function()
	require("telescope").extensions.zoxide.list(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>ht", function() -- Yes i like doom emacs keybindings
	require("telescope.builtin").colorscheme(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>is", function()
	require("telescope.builtin").symbols(minimal())
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>dl", function()
	require("telescope.builtin").diagnostics()
end, { silent = true, noremap = true })

vim.keymap.set("n", "<leader>ss", function()
	require("telescope.builtin").current_buffer_fuzzy_find()
end, { silent = true, noremap = true })
