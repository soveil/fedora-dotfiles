return {
	"romus204/tree-sitter-manager.nvim",
	dependencies = {}, -- tree-sitter CLI must be installed system-wide
	config = function()
		require("tree-sitter-manager").setup({
			ensure_installed = {
				"bash",
				"c",
				"comment",
				"cpp",
				"css",
				"desktop",
				"diff",
				"dockerfile",
				"ecma",
				"editorconfig",
				"gitcommit",
				"gitignore",
				"html",
				"html_tags",
				"http",
				"ini",
				"javascript",
				"json",
				"jsx",
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
				"tsx",
				"toml",
				"typescript",
				"udev",
				"xml",
				"yaml",
				"zathurarc",
				"zsh",
			},
			-- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
			-- auto_install = false, -- if enabled, install missing parsers when editing a new file
			-- highlight = true, -- treesitter highlighting is enabled by default
			-- languages = {}, -- override or add new parser sources
		})
	end,
}
