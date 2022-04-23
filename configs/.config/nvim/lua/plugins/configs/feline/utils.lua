local M = {}

M.vi_mode_text = {
	["n"] = "NORMAL",
	["no"] = "OP",
	["nov"] = "OP",
	["noV"] = "OP",
	["no"] = "OP",
	["niI"] = "NORMAL",
	["niR"] = "NORMAL",
	["niV"] = "NORMAL",
	["v"] = "VISUAL",
	["V"] = "LINES",
	[""] = "BLOCK",
	["s"] = "SELECT",
	["S"] = "SELECT",
	[""] = "BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["ix"] = "INSERT",
	["R"] = "REPLACE",
	["Rc"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["Rx"] = "REPLACE",
	["c"] = "COMMAND",
	["cv"] = "COMMAND",
	["ce"] = "COMMAND",
	["r"] = "ENTER",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERM",
	["nt"] = "TERM",
	["null"] = "NONE",
}

M.file_osinfo = function()
	local os = vim.bo.fileformat:upper()
	return os
end

return M
