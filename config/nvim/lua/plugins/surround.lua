local M = {
    "echasnovski/mini.surround",
    lazy = true,
    event = "VeryLazy",
    opts = {
        mappings = {
            add = "ga",
            delete = "gd",
            find = "gf",
            find_left = "gF",
            highlight = "gh",
            replace = "gr",
            update_n_lines = "gn",

            suffix_last = "l",
            suffix_next = "n",
        },
    },
    config = function(_, opts)
        require("mini.surround").setup(opts)
    end,
}

return M
