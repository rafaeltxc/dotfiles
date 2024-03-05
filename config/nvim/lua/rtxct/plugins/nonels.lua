local M = {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvimtools/none-ls-extras.nvim",
  },

  config = function()
    local null = require("null-ls")
    local formatting = null.builtins.formatting
    local diagnostics = null.builtins.diagnostics

    null.setup({
      border = "rounded",
      debug = true,
      sources = {
        -- Some plugins have been deprecated and will need to be used with none-ls-extras, as being used down below.
        require("none-ls.formatting.eslint"),
        require("none-ls.diagnostics.eslint"),

        -- Formatters
        formatting.stylua,
        formatting.google_java_format,
        formatting.clang_format,
        -- formatting.prettier,
        formatting.sql_formatter,
        formatting.yamlfmt,
      },
    })
  end,
}

return M
