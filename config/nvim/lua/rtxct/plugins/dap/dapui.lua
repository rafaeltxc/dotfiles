local M = {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  name = "dapui",

  opts = {},

  config = function(_, opts)
    local dap = require("dapui")
  end
}

return M
