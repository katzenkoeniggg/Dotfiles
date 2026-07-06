-- Border
require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

-- Close and Restore Tabs
require("close-and-restore-tab"):setup()

-- Session Restore
-- require("autosession"):setup()

-- Recycle Bin
require("recycle-bin"):setup()

-- osc7 yazi
require("osc7"):setup()

-- Easyjump
require("easyjump"):setup({
	icon_fg = "#94e2d5", -- color for hint labels
	first_key_fg = "#45475a", -- color for first char of double-key hints
	first_keys = "asdfgercwtvxbq", -- 14 keys
	second_keys = "yuiophjklnm", -- 11 keys
})
