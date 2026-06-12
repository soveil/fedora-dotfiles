require("lua.rofimoji")

local apps = require("lua.apps")
local functions = require("lua.functions")

-- https://wiki.hypr.land/Configuring/Basics/Binds/
hl.bind("SUPER + Q", hl.dsp.exec_cmd(apps.terminal))
hl.bind("SUPER + B", hl.dsp.exec_cmd(apps.browser))
hl.bind("SUPER + D", hl.dsp.exec_cmd(apps.menu))

hl.bind("SUPER + SHIFT + Q", hl.dsp.window.close())
hl.bind(
	"SUPER + CTRL + SHIFT + E",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SUPER + CTRL + SHIFT + L", hl.dsp.exec_cmd("systemctl hibernate"))

hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + T", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + left", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind("SUPER + SHIFT + down", hl.dsp.window.move({ direction = "down", group_aware = true }))
hl.bind("SUPER + SHIFT + up", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right", group_aware = true }))

-- Move focus with SUPER + hjkl
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down", group_aware = true }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right", group_aware = true }))

-- Group bindings
hl.bind("SUPER + TAB", hl.dsp.group.next())
hl.bind("SUPER + SHIFT + TAB", hl.dsp.group.prev())
hl.bind("SUPER + SHIFT + G", hl.dsp.group.toggle())

-- Group submap
hl.bind("SUPER + G", hl.dsp.submap("group"))
hl.define_submap("group", function()
	hl.bind("ESCAPE", hl.dsp.submap("reset"))
	hl.bind("H", hl.dsp.group.move_window({ forward = false }))
	hl.bind("L", hl.dsp.group.move_window({ forward = true }))
	hl.bind("TAB", hl.dsp.group.next())
	hl.bind("SHIFT + TAB", hl.dsp.group.prev())
	hl.bind("G", function()
		hl.dispatch(hl.dsp.group.toggle())
		hl.dispatch(hl.dsp.submap("reset"))
	end)
	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		hl.bind(tostring(key), function()
			hl.dispatch(hl.dsp.group.active({ index = i }))
			hl.dispatch(hl.dsp.submap("reset"))
		end)
	end
end)

-- Switch workspaces with SUPER + [0-9]
-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind("SUPER + SPACE", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with SUPER + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Move the workspace to the next monitor
hl.bind("SUPER + M", hl.dsp.workspace.move({ monitor = "+1" }))

-- Screenshot
hl.bind("SUPER + backslash", hl.dsp.exec_cmd(apps.screenshot))
hl.bind("SUPER + SHIFT + backslash", hl.dsp.exec_cmd(apps.screenshot .. " && wl-paste | imv &> /dev/null"))

--Color picker
hl.bind(
	"SUPER + CTRL + C",
	hl.dsp.exec_cmd(
		'grim -g "$(XCURSOR_SIZE=1 slurp -p -b "#00000000")" -t ppm - | magick - -format "%[pixel:p{0,0}]" txt:- | sed -nE "2s/.*(#.{6}).*/\\1/;2p" | tee >(xargs notify-send) | wl-copy -n'
	)
)

-- Open PDF
hl.bind(
	"SUPER + P",
	hl.dsp.exec_cmd(
		"file=$(fd -e pdf --base-directory ~ | rofi -dmenu -p "
			.. apps.pdf
			.. '); if [ -n "$file" ]; then '
			.. apps.pdf
			.. ' "$HOME"/"$file"; fi'
	)
)

hl.bind(
	"SUPER + SHIFT + P",
	hl.dsp.exec_cmd(
		"file=$(fd -H -I -e pdf --base-directory ~ | rofi -dmenu -p "
			.. apps.pdf
			.. '); if [ -n "$file" ]; then "'
			.. apps.pdf
			.. '" "$HOME/$file"; fi'
	)
)

-- AI workspace
hl.bind("SUPER + A", functions.toggle_ai)

-- Calculator
hl.workspace_rule({
	workspace = "special:qalc",
	on_created_empty = "kitty -o placement_strategy=center -o background=#29263c -o single_window_padding_width=8 -o confirm_os_window_close=0 -e qalc",
})

hl.window_rule({
	name = "qalc-float",
	match = { workspace = "special:qalc" },
	float = true,
	size = "600 400",
	move = { "cursor_x-(window_w*0.5)", "cursor_y-(window_h*0.5)" },
})

hl.bind("SUPER + C", hl.dsp.workspace.toggle_special("qalc"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
