local M = {}

---@diagnostic disable: lowercase-global
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.filetype.add {
	extension = {
		mod = "gomod",
		fish = "fish",
		tex = "tex",
		fnl = "fennel",
	},
}

lspLangs = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"typescriptcommon",
	"c",
	"cpp",
	"lua",
	"rust",
	"bash",
	"sh",
	"zsh",
	"html",
	"php",
	"css",
	"go",
	"markdown",
	"tex",
	"vue",
	"lisp",
	"java",
	"ruby",
	"python",
	"julia",
	"vim",
	"nix",
}

tsEnsureInstall = {
	"lua",
	"vim",
	"bash",
	"fish",
	"c",
	"cpp",
	"gomod",
	"go",
	"rust",
	"html",
	"css",
	"javascript",
	"typescript",
	"tsx",
	"python",
	"ruby",
	"php",
	"yaml",
	"json",
	"latex",
	"markdown",
	"make",
	"cmake",
	"vue",
	"fennel",
	"commonlisp",
	"java",
	"julia",
	"nix",
	"toml",
}

tsFileTypes = {
	"lua",
	"vim",
	"bash",
	"sh",
	"zsh",
	"fish",
	"c",
	"cpp",
	"go",
	"rust",
	"html",
	"css",
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"typescriptcommon",
	"python",
	"ruby",
	"php",
	"yaml",
	"json",
	"tex",
	"markdown",
	"make",
	"cmake",
	"gomod",
	"vue",
	"fennel",
	"lisp",
	"java",
	"julia",
	"nix",
	"toml",
}

M.transparent_background =
	function() -- This is a just a function for colorschemes without the option for transparent background
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.cmd [[
			hi Normal ctermbg=none guibg=none"
			hi SignColumn ctermbg=none guibg=none"
			hi NormalNC ctermbg=none guibg=none"
			hi MsgArea ctermbg=none guibg=none"
			hi TelescopeBorder ctermbg=none guibg=none"
			hi NvimTreeNormal ctermbg=none guibg=none"
			]]
			end,
		})
	end

return M
