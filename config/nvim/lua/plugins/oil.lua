local M = {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
        default_file_explorer = false,
        columns = {},
        float = {
            padding = 2,
            max_width = 90,
            max_height = 30,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
        },
        view_options = {
            show_hidden = true,
        },
    },
    config = function(_, opts)
        require("oil").setup(opts)
    end,
}

return M
