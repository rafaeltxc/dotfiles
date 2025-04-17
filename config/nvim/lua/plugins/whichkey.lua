local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = {
    "echasnovski/mini.icons"
  },
  opts = {
    preset = "modern",
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    triggers = {
      { "<leader>", mode = { "n", "v" } },
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "",
      mappings = false,
    },
    win = {
      no_overlap = true,
      border = "rounded",
      width = 100,
      height = 7,
      padding = { 1, 1 },
    },
    layout = {
      height = { min = 3, max = 5 },
      width = { min = 1, max = 30 },
      align = "center",
      spacing = 3,
    },
    show_keys = true,
    show_help = true,
    title = false,
  },

  config = function(_, opts)
    local pk = require("utils.plugins-keymaps")
    local wk = require("which-key")

    wk.setup(opts)
    wk.add(pk)
  end
}

return M
