local wezterm = require("wezterm")
local keybinds = require("keybinds")

return {
	font = wezterm.font_with_fallback({
		"Fira Code",
		"DengXian",
	}),
	font_size = 16,
	check_for_updates = false,
	-- default_prog = { "tmux", "attach" },
	color_scheme = "nord",
	hide_tab_bar_if_only_one_tab = true,
	window_close_confirmation = "NeverPrompt",
	adjust_window_size_when_changing_font_size = false,
	warn_about_missing_glyphs = false,
	window_padding = { left = 0, right = 0, top = 0, bottom = 0 },
	enable_wayland = false,
	use_ime = true,
	disable_default_key_bindings = true,
	keys = keybinds.ckeys,
	key_tables = keybinds.ckey_tables,
	initial_cols = 999,
	initial_rows = 999,
}
