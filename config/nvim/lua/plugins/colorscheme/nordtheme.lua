local M = {
    "shaunsingh/nord.nvim",
    lazy = false,
    opts = {},
    config = function(_, opts)
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = true
        vim.g.nord_italic = true
        vim.g.nord_uniform_diff_background = true
        vim.g.nord_bold = false

        require("nord").set()

        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
    end,
}

return M
