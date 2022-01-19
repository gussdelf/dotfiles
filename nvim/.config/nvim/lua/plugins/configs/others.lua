M = {}

M.bufferline = function()
	local present, bufferline = pcall(require, "bufferline")
	if present then
		require("bufferline").setup {}
		map("n", "<leader>bj", "<cmd>BufferLineCycleNext<CR>", { silent = true })
		map("n", "<leader>bk", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
	end
end

M.colorizer = function()
	local present, colorizer = pcall(require, "colorizer")
	if present then
		require("colorizer").setup()
	end
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

		-- Mapping
		map("n", "f", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
		map("n", "F", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
		map("v", "f", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
		map("v", "F", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
		map("o", "f", '<cmd>lua require"hop".hint_lines()<cr>', { silent = true })
		map("o", "F", '<cmd>lua require"hop".hint_words()<cr>', { silent = true })
	end
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
			hint_prefix = " ",
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

M.gitsigns = function()
	local present, gitsigns = pcall(require, "gitsigns")
	if present then
		gitsigns.setup {
			signs = {
				add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
				change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
				delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
				topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
				changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
			},
		}
	end
end

return M
