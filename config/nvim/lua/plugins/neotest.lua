local M = {
    "nvim-neotest/neotest",
    event = "VeryLazy",
    lazy = true,
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- Adapters
        "marilari88/neotest-vitest",
        "rcasia/neotest-java",
        "nvim-neotest/neotest-jest",
    },

    config = function()
        local ap = require("neotest")

        ap.setup({
            adapters = {
                require("neotest-java"),
                require("neotest-vitest"),
                require("neotest-jest"),
            },
        })
    end,
}

return M
