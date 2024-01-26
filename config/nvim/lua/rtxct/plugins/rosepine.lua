local M = {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = true,
	lazy = false,
	priority = 1000,
	opts = {
		variant = "main", -- auto, main, moon, or dawn
		dark_variant = "main", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = true,
			migrations = true,
		},

		styles = {
			bold = true,
			italic = true,
			transparency = true,
		},

		groups = {
			border = "muted",
			link = "iris",
			panel = "surface",

			error = "None",
			hint = "None",
			info = "None",
			note = "None",
			todo = "None",
			warn = "None",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
	},

	config = function(_, opts)
		local rp = require("rose-pine")
		rp.setup(opts)
		vim.cmd("colorscheme rose-pine")
	end,
}

return M
