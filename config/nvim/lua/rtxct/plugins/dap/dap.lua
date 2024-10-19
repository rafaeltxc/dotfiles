local M = {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",
  name = "dap",

  opts = {},

  config = function(_, opts)
    local dap = require("dap")
  end
}

return M
