local M = {
  "SidOfc/carbon.nvim",
  lazy = false,
  opts = {
    compress = true,
    auto_open = true,
    keep_netrw = false,
    file_icons = false,
    sync_on_cd = false,
    sync_delay = 200,
    auto_reveal = true,
    open_on_dir = true,
    exclude = {
      "node_modules",
    },

    indicators = {
      expand = "",
      collapse = "",
    },

    flash = {
      delay = 50,
      duration = 500,
    },

    actions = {
      create = { "a" },
      delete = "D",
      quit = "q",
      edit = "<cr>",
      move = "m",
      up = "[",
      down = "]",
      reset = "u",
      split = { "<c-x>", "<c-s>" },
      vsplit = "<c-v>",
      close_parent = "-",
      toggle_hidden = "*",
      toggle_recursive = "!",
    },
  },

  confg = function(_, opts)
    local carbon = require("carbon")
    carbon.setup(opts)
  end,
}

return M
