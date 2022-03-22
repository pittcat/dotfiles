local wezterm = require("wezterm")

local ac = wezterm.action
local keys = {
	{ key = "C", mods = "CTRL|SHIFT", action = ac({ CopyTo = "Clipboard" }) },
	{ key = "V", mods = "CTRL|SHIFT", action = ac({ PasteFrom = "Clipboard" }) },
	{ key = "Insert", mods = "SHIFT", action = ac({ PasteFrom = "PrimarySelection" }) },
	{ key = "PageUp", mods = "SHIFT", action = ac({ ScrollByPage = -1 }) },
	{ key = "PageDown", mods = "SHIFT", action = ac({ ScrollByPage = 1 }) },
	{ key = "Home", mods = "SHIFT", action = "ScrollToTop" },
	{ key = "End", mods = "SHIFT", action = "ScrollToBottom" },
	{ key = "=", mods = "CTRL|ALT", action = "ResetFontSize" },
	{ key = "=", mods = "CTRL", action = "IncreaseFontSize" },
	{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
}

return {
	font = wezterm.font_with_fallback({ "FiraCode Nerd Font", "Hack Nerd Font" }),
	font_size = 16,
	check_for_updates = false,
	-- default_prog = { "tmux", "attach" },
	color_scheme = "nord",
	hide_tab_bar_if_only_one_tab = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	use_ime = true,
	disable_default_key_bindings = true,
	keys = keys,
	initial_cols = 999,
	initial_rows = 999,
}
