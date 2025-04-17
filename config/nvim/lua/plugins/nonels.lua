local M = {
    "nvimtools/none-ls.nvim",
    lazy = false,
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
                require("none-ls.formatting.eslint"),
                require("none-ls.diagnostics.eslint"),
                require("none-ls.formatting.jq"),

                -- formatting.shfmt,
                formatting.stylua,
                formatting.google_java_format,
                formatting.sql_formatter,
                formatting.yamlfmt,
                formatting.prettierd,
            },
        })
    end,
}

return M
