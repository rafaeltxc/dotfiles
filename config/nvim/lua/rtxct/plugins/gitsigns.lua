local M = {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		signcolumn = true,
		watch_gitdir = {
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = true,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "eol",
			delay = 500,
			ignore_whitespace = false,
			virt_text_priority = 100,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil,
		max_file_length = nil,
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 1,
			col = 1,
		},
		yadm = {
			enable = false,
		},
	},

	config = function(_, opts)
		local gitsigns = require("gitsigns")

		vim.cmd([[highlight GitSignsAdd guibg=NONE]])
		vim.cmd([[highlight GitSignsChange guibg=NONE]])
		vim.cmd([[highlight GitSignsDelete guibg=NONE]])
		vim.cmd([[highlight GitSignsChangeDelete guibg=NONE]])

		gitsigns.setup(opts)
	end,
}

return M
