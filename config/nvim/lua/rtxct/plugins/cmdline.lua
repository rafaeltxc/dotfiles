local M = {
  'VonHeikemen/fine-cmdline.nvim',
  event = "VeryLazy",
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  opts = {
    cmdline = {
      enable_keymaps = true,
      smart_history = true,
      prompt = '  :'
    },
    popup = {
      position = {
        row = '50%',
        col = '50%',
      },
      size = {
      width = '30%',
      },
      border = {
        style = 'rounded',
        text = {
          top = "Prompt",
          top_align = "center",
        }
      },
      win_options = {
        winhighlight = 'Normal:Normal,FloatBorder:FloatBorder',
      },
    },
  },

  config = function(_, opts)
    local cmdline = require("fine-cmdline")
    cmdline.setup(opts)
  end
}

return M
