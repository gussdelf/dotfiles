local luasnip = require "luasnip"

require("luasnip.loaders.from_vscode").load { include = { "python" } }

luasnip.config.set_config {
	history = true,
	updateevents = "TextChanged,TextChangedI",
}
