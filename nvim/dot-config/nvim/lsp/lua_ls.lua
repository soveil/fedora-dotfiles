return {
	settings = {
		Lua = {
			runtime = {
				version = _VERSION,
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
				},
			},
		},
	},
}
