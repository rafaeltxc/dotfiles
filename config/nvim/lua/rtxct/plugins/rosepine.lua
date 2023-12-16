local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = true,
	lazy = false,
	priority = 1000,
	opts = {
		--- @usage 'main'|'moon'|'dawn'
		variant = "main",
		dark_variant = "main",
		bold_vert_split = false,
		dim_nc_background = false,
		disable_background = true,
		disable_float_background = true,
		disable_italics = false,

		--- @usage string hex value or named color from rosepinetheme.com/palette
		groups = {
			background = "base",
			background_nc = "base",
			panel = "None",
			panel_nc = "base",
			border = "highlight_med",
			comment = "muted",
			link = "iris",
			punctuation = "None",

			error = "None",
			hint = "None",
			info = "None",
			warn = "None",

			headings = {
				h1 = "iris",
				h2 = "foam",
				h3 = "rose",
				h4 = "gold",
				h5 = "pine",
				h6 = "foam",
			},
			highlight_groups = {
				DiagnosticSign = {
					bg = "None",
				},
			},
		},
	},

	config = function(_, opts)
		local rp = require("rose-pine")
		rp.setup(opts)
		vim.cmd("colorscheme rose-pine")
	end,
}

return M
