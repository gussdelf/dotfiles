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
		prompt_prefix = " 🔭 ",
		selection_caret = "  ",
		entry_prefix = "  ",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
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
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules", ".git" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		color_devicons = true,
		use_less = true,
		-- preview = false,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	},
	pickers = {
		find_files = {
			hidden = true,
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
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
		},
		buffers = {
			preview = true,
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

map("n", "<leader>bb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", { silent = true })
map("n", "<leader>fp", "<cmd>lua require('telescope.builtin').git_files()<cr>", { silent = true })
map("n", "<leader>ft", "<cmd>lua require('telescope.builtin').filetypes()<cr>", { silent = true })
map("n", "<leader>j", "<cmd>lua require('telescope').extensions.zoxide.list()<cr>", { silent = true })
map("n", "<leader>fd", "<cmd>lua require('telescope').extensions.file_browser.file_browser()<cr>", { silent = true })
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { silent = true })
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { silent = true })
map("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { silent = true })
map("n", "<leader>cc", "<cmd>lua require('telescope.builtin').colorscheme()<cr>", { silent = true })
map("n", "<leader>is", "<cmd>lua require('telescope.builtin').symbols()<cr>", { silent = true })
map(
	"n",
	"<leader>ss",
	"<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case previewer=false<cr>",
	{ silent = true }
)
