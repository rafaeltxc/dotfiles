local M = {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {
      style = "night",
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "transparent",
        floats = "trasnparent",
      },

      -- Table properties -- 
      -- https://github.com/folke/tokyonight.nvim/tree/f247ee700b569ed43f39320413a13ba9b0aef0db/extras/lua
    on_colors = function(colors)
      colors.border_highlight = "#ffffff"
    end,

    on_highlights = function(highlights, colors)
      highlights.GitSignsCurrentLineBlame = {
        bg = colors.none,
        fg = "#ffffff"
      }
    end,
  },

  config = function(_, opts)
    local tokyonight = require("tokyonight")
    tokyonight.setup(opts)
    tokyonight.load()
  end
}

return M
