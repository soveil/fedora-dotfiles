local apps = require("lua.apps")

local M = {}

M.toggle_workspace = function(id)
	if hl.get_active_workspace().id == id then
		hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
		return
	end

	hl.dispatch(hl.dsp.focus({ workspace = id }))
end

return M
