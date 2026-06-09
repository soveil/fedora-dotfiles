return {
	"saghen/blink.cmp",
	dependencies = { "L3MON4D3/LuaSnip", "xzbdmw/colorful-menu.nvim" },
	cond = not vim.g.vscode,
	version = "v1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = false,
			["<S-Tab>"] = false,
			["<C-j>"] = { "snippet_forward", "fallback" },
			["<C-k>"] = { "snippet_backward", "fallback" },
			-- ["<C-k>"] = { "scroll_documentation_up", "fallback" },
			-- ["<C-j>"] = { "scroll_documentation_down", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			list = { selection = { auto_insert = false } },
			documentation = { auto_show = true, auto_show_delay_ms = 100, window = { border = "rounded" } },
			ghost_text = { enabled = false },
			menu = {
				border = "none",
				draw = {
					columns = { { "label", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},

		signature = { enabled = true },

		snippets = { preset = "luasnip" },

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
