local apps = require("lua.apps")

local M = {}

M.toggle_workspace = function(id)
	if hl.get_active_workspace().id == id then
		hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
		return
	end

	hl.dispatch(hl.dsp.focus({ workspace = id }))
end

-- M.toggle_workspace_cmd = function(name, cmd)
-- 	local workspace_def = { workspace = "name:" .. name }
--
-- 	if hl.get_active_workspace().name == name then
-- 		hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
-- 		return
-- 	end
--
-- 	local workspaces = hl.get_workspaces()
-- 	for _, ws in ipairs(workspaces) do
-- 		if ws.name == name then
-- 			hl.dispatch(hl.dsp.focus(workspace_def))
-- 			return
-- 		end
-- 	end
--
-- 	hl.dispatch(hl.dsp.focus(workspace_def))
-- 	hl.dispatch(hl.dsp.exec_cmd(cmd, workspace_def))
-- end
--
-- M.toggle_terminal = function()
-- 	M.toggle_workspace_cmd("1", apps.terminal)
-- end
--
-- M.toggle_browser = function()
-- 	M.toggle_workspace_cmd("2", apps.browser)
-- end
--
-- M.toggle_editor = function()
-- 	M.toggle_workspace_cmd("3", apps.menu)
-- end
--
-- M.toggle_ai = function()
-- 	M.toggle_workspace_cmd("4", "firefox --new-instance -P kiosk chatgpt.com claude.ai gemini.google.com")
-- end

return M
