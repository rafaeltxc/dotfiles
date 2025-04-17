local M = {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-dap.nvim"
    },
    opts = {
        defaults = {
            layout_strategy = "vertical",
            layout_config = {
                height = 0.9,
                width = 0.5,
                prompt_position = "top",
                preview_cutoff = 1,
                preview_height = 0.35,
            },

            sorting_strategy = "ascending",
            results_title = false,
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },

            file_ignore_patterns = {
                "node_modules/",
                ".git/",
            },

            mappings = {
                i = {
                    ["<C-c>"] = "close",
                },
                n = {
                    ["q"] = "close",
                },
            },
        },

        pickers = {
            find_files = {
                hidden = true,
                no_ignore = true,
            },
        },

        extensions = {
            undo = {},
        },
    },

    config = function(_, opts)
        local telescope = require("telescope")

        require("telescope").load_extension("noice")
        require("telescope").load_extension("undo")
        require("telescope").load_extension("projects")

        telescope.setup(opts)
    end,
}

return M
