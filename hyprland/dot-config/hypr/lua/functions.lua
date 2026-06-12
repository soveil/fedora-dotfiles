return {
	toggle_ai = function()
		if hl.get_active_workspace().name == "" then
			hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
			return
		end

		local workspaces = hl.get_workspaces()
		for _, ws in ipairs(workspaces) do
			if ws.name == "" then
				hl.dispatch(hl.dsp.focus({ workspace = "name:" }))
				return
			end
		end
		hl.dispatch(hl.dsp.focus({ workspace = "name:" }))
		hl.dispatch(
			hl.dsp.exec_cmd(
				"firefox --new-instance -P kiosk chatgpt.com claude.ai gemini.google.com",
				{ workspace = "name:" }
			)
		)
	end,
}
