return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	cond = not vim.g.vscode,
	init = function()
		-- vim.treesitter.language.register("jsx", { "javascriptreact" })
		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "<filetype>" },
			callback = function()
				vim.treesitter.start()
			end,
		})
		require("nvim-treesitter").setup({
			highlight = {
				enable = true,
			},
		})
		require("nvim-treesitter").install({
			"bash",
			"c",
			"comment",
			"cpp",
			"css",
			"desktop",
			"diff",
			"dockerfile",
			"editorconfig",
			"gitcommit",
			"gitignore",
			"html",
			"html_tags",
			"http",
			"ini",
			"javascript",
			"json",
			"kitty",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"nix",
			"jsx",
			"python",
			"regex",
			"rust",
			"sql",
			"ssh_config",
			"svelte",
			"sway",
			"toml",
			"tsx",
			"typescript",
			"udev",
			"xml",
			"yaml",
			"zathurarc",
			"zsh",
		})
	end,
}
