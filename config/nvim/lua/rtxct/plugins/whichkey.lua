local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    popup_mappings = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    icons = {
      breadcrumb = "»",
      separator = "➜",
      group = "",
    },
    window = {
      border = "rounded",
      position = "bottom",
      margin = { 0, 20, 5, 20 },
      padding = { 0, 0, 0, 0 },
      winblend = 0,
      zindex = 1000,
    },
    layout = {
      height = { min = 3, max = 5 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "center",
    },
    ignore_missing = true,
    show_keys = false,
    show_help = false,
  },

  config = function(_, opts)
    local pk = require("rtxct.utils.plugins-keymaps")
    local wk = require("which-key")

    wk.setup(opts)
    wk.register(pk, { prefix = "<leader>" })
  end
}

return M
