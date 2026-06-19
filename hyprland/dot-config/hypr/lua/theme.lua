local catppuccin = require("lua.catppuccin-mocha")

local inactive_border = catppuccin.base
local active_border = catppuccin.lavender

local inactive_group_border = inactive_border
local inactive_group_bar = catppuccin.base
local active_group_border = active_border
local active_group_bar = catppuccin.overlay2
local inactive_group_text = catppuccin.subtext0
local active_group_text = catppuccin.crust

local rounding = 0
local rounding_power = 0
-- local rounding = 4
-- local rounding_power = 4

-- https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		-- gaps_in = 2,
		-- gaps_out = 4,
		gaps_in = 0,
		gaps_out = 0,

		border_size = 2,

		col = {
			active_border = active_border,
			inactive_border = inactive_border,
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		rounding = rounding,
		rounding_power = rounding_power,

		-- Change transparency of focused and unfocused windows
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = 0xee1a1a1a,
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},

	group = {
		col = {
			border_active = active_group_border,
			border_inactive = inactive_group_border,
		},
		groupbar = {
			render_titles = true,
			indicator_height = 0,
			height = 16,
			font_size = 12,
			gaps_in = 0,
			gaps_out = 0,
			gradients = true,
			keep_upper_gap = false,
			rounding = rounding,
			rounding_power = rounding_power,
			gradient_rounding = rounding * 4,
			gradient_rounding_power = rounding_power,
			text_color = active_group_text,
			text_color_inactive = inactive_group_text,
			col = {
				active = active_group_bar,
				inactive = inactive_group_bar,
			},
		},
	},
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global", enabled = true, speed = 1, bezier = "quick" })
-- hl.animation({ leaf = "border", enabled = true, speed = 1, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "windows", enabled = true, speed = 1, spring = "easy" })
-- hl.animation({ leaf = "windowsIn", enabled = true, speed = 1, spring = "easy", style = "popin 87%" })
-- hl.animation({ leaf = "windowsOut", enabled = true, speed = 1, bezier = "linear", style = "popin 87%" })
-- hl.animation({ leaf = "fadeIn", enabled = true, speed = 1, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeOut", enabled = true, speed = 1, bezier = "almostLinear" })
-- hl.animation({ leaf = "fade", enabled = true, speed = 1, bezier = "quick" })
-- hl.animation({ leaf = "layers", enabled = true, speed = 1, bezier = "easeOutQuint" })
-- hl.animation({ leaf = "layersIn", enabled = true, speed = 1, bezier = "easeOutQuint", style = "fade" })
-- hl.animation({ leaf = "layersOut", enabled = true, speed = 1, bezier = "linear", style = "fade" })
-- hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1, bezier = "almostLinear" })
-- hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1, bezier = "almostLinear" })
-- hl.animation({ leaf = "workspaces", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1, bezier = "almostLinear", style = "fade" })
-- hl.animation({ leaf = "zoomFactor", enabled = true, speed = 1, bezier = "quick" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
