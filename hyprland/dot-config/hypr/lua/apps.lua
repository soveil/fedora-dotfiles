local M = {}

M.ai = "firefox --new-instance -P kiosk chatgpt.com claude.ai gemini.google.com"
M.pdf = "zathura"
M.browser = "firefox"
M.calc = "qalc"
M.menu_cmd = "rofi -terminal '$term'"
M.terminal = "kitty"
M.tui =
	"kitty -o placement_strategy=center -o background=#29263c -o single_window_padding_width=8 -o confirm_os_window_close=0"

M.menu = "rofi -terminal '$term' -modes 'drun,run' -show drun"

M.screenshot = "~/dotfiles/hyprland/dot-config/hypr/screenshot.sh"

return M
