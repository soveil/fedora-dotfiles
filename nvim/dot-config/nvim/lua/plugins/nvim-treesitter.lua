return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	init = function()
		if not vim.g.vscode then
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "<filetype>" },
				callback = function()
					vim.treesitter.start()
				end,
			})
		end
		require("nvim-treesitter").setup({})
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
