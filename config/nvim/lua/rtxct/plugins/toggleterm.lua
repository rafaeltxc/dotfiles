local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = {
    open_mapping = [[<c-t>]],
    shell = "zsh",
    direction = "float",
    persist_size = true,
    persist_mode = true,
    auto_scroll = true,
    float_opts = {
      border = "rounded",
      width = 100,
      height = 25,
      winblend = 0,
      zindex = 1000,
    },
  },

  config = function(_, opts)
    local tt = require("toggleterm")
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      shell = "zsh",
      direction = "float",
      persist_size = true,
      persist_mode = true,
      auto_scroll = true,
      float_opts = {
        border = "rounded",
        width = 100,
        height = 25,
        winblend = 0,
        zindex = 1000,
      },
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

    tt.setup(opts)
  end,
}

return M
