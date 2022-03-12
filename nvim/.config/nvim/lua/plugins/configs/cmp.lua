---@diagnostic disable: different-requires

local M = {}

local cmp = require "cmp"

vim.opt.completeopt = "menuone,noselect"

local kind_icons = {
	Class = " ",
	Color = " ",
	Constant = "ﲀ ",
	Constructor = " ",
	Enum = "練",
	EnumMember = " ",
	Event = " ",
	Field = " ",
	File = "",
	Folder = " ",
	Function = " ",
	Interface = "ﰮ ",
	Keyword = " ",
	Method = " ",
	Module = " ",
	Operator = "",
	Property = " ",
	Reference = " ",
	Snippet = " ",
	Struct = " ",
	Text = " ",
	TypeParameter = " ",
	Unit = "塞",
	Value = " ",
	Variable = " ",
}

local border = {
	"╔",
	"═",
	"╗",
	"║",
	"╝",
	"═",
	"╚",
	"║",

	-- "┌",
	-- "─",
	-- "┐",
	-- "│",
	-- "┘",
	-- "─",
	-- "└",
	-- "│",
}

cmp.setup {
	window = {
		completion = {
			border = border,
			scrollbar = "┃",
		},
		documentation = {
			border = border,
			scrollbar = "┃",
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			-- -- Source
			vim_item.menu = ({
				buffer = "Buffer",
				nvim_lsp = "LSP",
				name = "Api",
				luasnip = "Snippets",
				latex_symbols = "LaTeX",
				tmux = "Tmux",
				cmp_tabnine = "TabNine",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif require("luasnip").expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif require("luasnip").jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
	},
	sources = {
		{ name = "nvim_lsp_signature_help", priority = 10 },
		{ name = "nvim_lua", priority = 9 },
		{ name = "cmp_tabnine", priority = 8 },
		{ name = "nvim_lsp", priority = 7 },
		{ name = "buffer", priority = 6 },
		{ name = "path", priority = 5 },
		{ name = "luasnip", priority = 4 },
		{ name = "tmux", priority = 3 },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	experimental = {
		ghost_text = true,
	},
	enable = function()
		if vim.bo.ft == "TelescopePrompt" then
			return false
		end

		if string.find(vim.api.nvim_buf_get_name(0), "s_popup:/") then
			return false
		end
	end,
}

return M
