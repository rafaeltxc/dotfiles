local M = {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",
      height = 10,
      width = 50,
      icons = true,
      severity = nil,
      fold_open = "",
      fold_closed = "",
      group = true,
      padding = true,
      cycle_results = true,
      action_keys = {
        close = "q",
        cancel = "<esc>",
        refresh = "r",
        jump = { "<cr>", "<tab>" },
        jump_close = {"o"},
        toggle_mode = "m",
        switch_severity = "s",
        toggle_preview = "P",
        hover = "K",
        preview = "p",
        open_code_href = "c",
        previous = "k",
        next = "j",
        help = "?",
      },
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
    },

  config = function(_, opts)
    local trouble = require("trouble")
    trouble.setup(opts)
  end
}

return M
