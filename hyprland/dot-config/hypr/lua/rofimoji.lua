hl.bind("SUPER + S", hl.dsp.submap("symbol"))
hl.define_submap("symbol", function()
	hl.bind("ESCAPE", hl.dsp.submap("reset"))

	-- Emojis
	hl.bind("E", function()
		hl.dispatch(hl.dsp.exec_cmd("rofimoji --files emoji --prompt '😀 '"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	-- Math
	hl.bind("M", function()
		hl.dispatch(hl.dsp.exec_cmd("rofimoji --files math --prompt '∑ '"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	-- Nerd Font
	hl.bind("N", function()
		hl.dispatch(hl.dsp.exec_cmd("rofimoji --files nerd_font --prompt ' '"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	-- Font Awesome
	hl.bind("A", function()
		hl.dispatch(hl.dsp.exec_cmd("rofimoji --files fontawesome6 --prompt ' '"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end)
