---@diagnostic disable: different-requires
require("telescope").setup {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--ignore-vcs",
		},
		mappings = {
			n = {
				["<C-t>"] = require("telescope.actions.layout").toggle_preview,
			},
			i = {
				["<C-t>"] = require("telescope.actions.layout").toggle_preview,
			},
		},
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules", ".git" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		selection_caret = "  ",
		entry_prefix = "  ",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		use_less = true,
		winblend = 0,
		border = {},
	},
	pickers = {
		find_files = {
			mappings = {
				n = {
					["cd"] = function(prompt_bufnr)
						local selection = require("telescope.actions.state").get_selected_entry()
						local dir = vim.fn.fnamemodify(selection.path, ":p:h")
						require("telescope.actions").close(prompt_bufnr)
						-- Depending on what you want put `cd`, `lcd`, `tcd`
						vim.cmd(string.format("silent lcd %s", dir))
					end,
				},
			},
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			prompt_title = false,
			hidden = true,
			width = 2.0,
		},
		buffers = {
			borderchars = {
				{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
			},
			theme = "dropdown",
			previewer = false,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		file_browser = {
			hidden = true,
		},
	},
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "file_browser"
require("telescope").load_extension "zoxide"

vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { silent = true })

vim.keymap.set("n", "<leader>fp", function()
	require("telescope.builtin").git_files()
end, { silent = true })

vim.keymap.set("n", "<leader>ft", function()
	require("telescope.builtin").filetypes()
end, { silent = true })

vim.keymap.set("n", "<leader>j", function()
	require("telescope").extensions.zoxide.list()
end, { silent = true })

vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { silent = true })

vim.keymap.set("n", "<leader>fb", function()
	require("telescope.builtin").buffers()
end, { silent = true })

vim.keymap.set("n", "<leader>fh", function()
	require("telescope.builtin").help_tags()
end, { silent = true })

vim.keymap.set("n", "<leader>cc", function()
	require("telescope.builtin").colorscheme()
end, { silent = true })

vim.keymap.set("n", "<leader>is", function()
	require("telescope.builtin").symbols()
end, { silent = true })

vim.keymap.set(
	"n",
	"<leader>ss",
	"<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case previewer=false<cr>",
	{ silent = true }
)

vim.keymap.set(
	"n",
	"<leader>fd",
	"<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>",
	{ silent = true }
)
