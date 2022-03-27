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
				"Outline",
				"TelescopePrompt",
			},
		},
		extensions = { "toggleterm" },
	}
	vim.opt.laststatus = 3
end

M.bufferline = function()
	require("bufferline").setup {
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
	}
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

M.autopairs = function()
	local cmp_autopairs = require "nvim-autopairs.completion.cmp"
	local cmp = require "cmp"
	local Rule = require "nvim-autopairs.rule"
	local npairs = require "nvim-autopairs"

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

	cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
	require("nvim-autopairs").setup()
	npairs.add_rule(Rule("$$", "$$", "tex"))
end

M.colorizer = function()
	require("colorizer").setup()
	vim.keymap.set("n", "<leader>ct", "<cmd>ColorizerToggle<cr>", { silent = true })
end

M.todo_comments = function()
	require("todo-comments").setup()
	vim.keymap.set("n", "<leader>to", "<cmd>TodoTrouble<cr>", { silent = true })
end

M.marks = function()
	require("marks").setup {
		default_mappings = true,
		cyclic = true,
		force_write_shada = false,
		refresh_interval = 250,
		sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	}
end

M.harpoon = function()
	vim.keymap.set("n", "<leader>ha", function()
		require("harpoon.mark").add_file()
	end, { silent = true })

	vim.keymap.set("n", "<leader>o", function()
		require("harpoon.ui").toggle_quick_menu()
	end, { silent = true })
end

M.luasnip = function()
	local luasnip = require "luasnip"
	luasnip.config.set_config {
		history = true,
		updateevents = "TextChanged,TextChangedI",
	}
	require("luasnip.loaders.from_vscode").lazy_load()
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

M.trouble = function()
	require("trouble").setup {}
	vim.keymap.set("n", "<leader>tt", "<cmd>TroubleToggle<cr>", { silent = true })
	vim.keymap.set("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true })
	vim.keymap.set("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true })
end

M.null_ls = function()
	require("null-ls").setup {
		sources = {
			require("null-ls").builtins.formatting.stylua,
			require("null-ls").builtins.formatting.gofmt,
			require("null-ls").builtins.formatting.black,
			require("null-ls").builtins.formatting.rustfmt,
			require("null-ls").builtins.formatting.clang_format,
			require("null-ls").builtins.formatting.deno_fmt.with {
				extra_args = function()
					return {
						"--options-use-tabs",
					}
				end,
			},
		},
		on_attach = function(client)
			if client.resolved_capabilities.document_formatting then
				vim.api.nvim_create_augroup("nulllsFormatGroup", { clear = true })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = "nulllsFormatGroup",
					pattern = "*",
					callback = function()
						vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
	}
	vim.keymap.set("n", "<C-f>", "<Cmd>lua vim.lsp.buf.formatting()<cr>", { silent = true })
	vim.keymap.set("v", "<C-f>", "<Cmd>lua vim.lsp.buf.range_formatting()<cr>", { silent = true })
end

M.venn = function()
	Toggle_venn = function()
		local venn_enabled = vim.inspect(vim.b.venn_enabled)
		if venn_enabled == "nil" then
			vim.b.venn_enabled = true
			vim.cmd [[setlocal ve=all]]
			-- draw a line on HJKL keystokes
			vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true })
			vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true })
			vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true })
			vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true })
			-- draw a box by pressing "f" with visual selection
			vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true })
		else
			vim.cmd [[setlocal ve=]]
			vim.cmd [[mapclear <buffer>]]
			vim.b.venn_enabled = nil
		end
	end

	vim.keymap.set("n", "<leader>v", function()
		Toggle_venn()
	end, { silent = true })
end

M.nabla = function()
	vim.keymap.set("n", "<leader>p", function()
		require("nabla").popup()
	end, { silent = true })
end

return M
