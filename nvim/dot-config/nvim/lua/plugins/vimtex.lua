return {
	"lervag/vimtex",
	cond = false and not vim.g.vscode,
	init = function()
		vim.g.vimtex_view_method = "zathura_simple"
		vim.g.vimtex_compiler_latexmk = { aux_dir = "/tmp/vimtex", out_dir = "/tmp/vimtex" }
	end,
}
