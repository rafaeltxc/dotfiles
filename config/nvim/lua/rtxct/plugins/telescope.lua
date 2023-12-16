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
    local tl = require("telescope")
    tl.setup(opts)
  end,
}

return M
