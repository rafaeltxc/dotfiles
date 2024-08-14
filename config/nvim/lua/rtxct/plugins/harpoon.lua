local M = {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    settings = {
      save_on_toggle = false,
      border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  },

  config = function(_, opts)
    local harpoon = require("harpoon")
    harpoon.setup(opts)

    vim.keymap.set("n", "<C-p>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle Harpoon" })
    vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end, { desc = "Append to list" })

    vim.keymap.set("n", "<C-H>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-J>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-K>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-L>", function() harpoon:list():select(4) end)
  end
}

return M
