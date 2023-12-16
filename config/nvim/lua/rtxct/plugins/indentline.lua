local M = {
  'lukas-reineke/indent-blankline.nvim',
  event = "VeryLazy",
  main = "ibl",

  config = function()
    local ibl = require("ibl")
    --[[ local hooks = require("ibl.hooks")

    local highlight = {
      "CursorColumn",
    }

    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "CursorColumn", { fg = "#ff0000" })
    end) ]]

    ibl.setup({
      --[[ indent = {
        highlight = highlight,
      }, ]]
      scope = {
        enabled = true,
      },
    })
  end,
}

return M
