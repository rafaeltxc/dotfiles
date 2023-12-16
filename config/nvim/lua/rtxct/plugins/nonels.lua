local M = {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local null = require("null-ls")
    local formatting = null.builtins.formatting
    local diagnostics = null.builtins.diagnostics

    null.setup({
      border = "rounded",
      debug = true,
      sources = {
        -- Diagnostics
        diagnostics.eslint,

        -- Formatters
        formatting.stylua,
        formatting.google_java_format,
        formatting.clang_format,
        formatting.beautysh,
        formatting.prettier,
        formatting.eslint,
        formatting.sql_formatter,
        formatting.yamlfmt,
      },
    })
  end,
}

return M
