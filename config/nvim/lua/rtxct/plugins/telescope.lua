local M = {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"LinArcX/telescope-env.nvim",
	},
	opts = {
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				height = 0.65,
				width = 0.50,
				prompt_position = "top",
			},
			sorting_strategy = "ascending",
			results_title = false,
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },

			file_ignore_patterns = {
				"node_modules/",
				".git/",
			},

			mappings = {
				i = {
					["<C-c>"] = "close",
				},
				n = {
					["q"] = "close",
				},
			},
		},

		pickers = {
			find_files = {
				hidden = true,
			},
		},

		extensions = {
			env = {},
		},
	},

	config = function(_, opts)
		require("telescope").setup(opts)
	end,
}

return M
