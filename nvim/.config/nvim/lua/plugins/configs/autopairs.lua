local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp = require "cmp"

-- Autorpairs
require("nvim-autopairs").setup {
	fast_wrap = {},
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = "racket"
