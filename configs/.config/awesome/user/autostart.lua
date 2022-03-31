local awful = require("awful")

local M = {}

M.setup = function()
	local cmds = {
		"setxkbmap -model abnt2 -layout br -option ctrl:swapcaps",
		'xinput --set-prop "SIGMACHIP Usb Mouse" "Coordinate Transformation Matrix" 0.5 0 0 0 0.5 0 0 0 1',
		"xsetroot -cursor_name left_ptr",
		"picom",
		"feh --bg-scale ~/Imgs/wall/forest.jpg --no-fehbg",
		"xrdb ~/.config/Xresources/Gruvbox",
	}

	for _, i in pairs(cmds) do
		awful.spawn.with_shell(i .. " &")
	end
end

return M
