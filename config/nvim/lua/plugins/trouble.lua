local M = {
    "folke/trouble.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        follow = false,
        focus = true,
        preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.4,
        },
        keys = {
            ["<cr>"] = "jump_close",
        },
    },

    config = function(_, opts)
        local trouble = require("trouble")
        trouble.setup(opts)

        vim.api.nvim_create_autocmd("BufLeave", {
            pattern = "Trouble",
            callback = function()
                trouble.close()
            end,
        })
    end,
}

return M
