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

-- Just some things to lazy load properly
vim.cmd[[
au BufRead,BufNewFile *.mod set filetype=gomod
au BufRead,BufNewFile *.tex set filetype=tex
]]

lspLangs = {
	"javascript", "javascriptreact", "typescript", "typescriptreact",
    "typescriptcommon", "c", "cpp", "lua", "rust", "bash", "sh", "html", "php",
    "css", "go", "markdown", "tex",
}
tsEnsureInstall = {
	"lua", "vim", "bash", "fish", "c", "cpp", "gomod", "go", "rust", "html",
    "css", "javascript", "typescript", "tsx", "python", "ruby", "php", "yaml",
    "json", "latex", "markdown", "make", "cmake",
}
tsFileTypes = {
    "lua", "vim", "bash", "fish", "c", "cpp", "go", "rust", "html", "css",
    "javascript", "javascriptreact", "typescript", "typescriptreact",
    "typescriptcommon", "python", "ruby", "php", "yaml", "json", "tex",
    "markdown", "make", "cmake", "gomod",
}
