local M = {
    "michaelb/sniprun",
    event = "VeryLazy",
    branch = "master",
    build = "sh install.sh",
    dependencies = {
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    background_colour = "#ffffff",
                })
            end
        }
    },
    opts = {
        selected_interpreters = {},
        repl_enable = {},
        repl_disable = {},
        interpreter_options = {},
        display = {
            "NvimNotify",
        },
        display_options = {
            notification_timeout = 2,
        },
        live_display = true,
        borders = "single",
        snipruncolors = {
            SniprunFloatingWinOk = { fg = "#33ff7d", ctermfg = "Green" },
            SniprunFloatingWinErr = { fg = "#881515", ctermfg = "DarkRed" },
        },
    },

    config = function(_, opts)
        local snip = require("sniprun")
        snip.setup(opts)
    end,
}

return M
