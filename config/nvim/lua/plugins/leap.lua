local M = {
    "ggandor/leap.nvim",
    lazy = false,
    dependencies = {
        "tpope/vim-repeat",
    },
    opts = {
        max_phase_one_targets = nil,
        highlight_unlabeled_phase_one_targets = false,
        max_highlighted_traversal_targets = 10,
        case_sensitive = false,
        equivalence_classes = { " \t\r\n" },
        substitute_chars = {},
        safe_labels = "sfnut/SFNLHMUGTZ?",
        labels = "sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?",
    },

    config = function(_, opts)
        local leap = require("leap")
        leap.create_default_mappings()

        leap.add_default_mappings()
        vim.api.nvim_set_keymap(
            'n', 's', '<Cmd>lua require("leap").leap({ target = vim.fn.expand("<cword>") })<CR>',
            { noremap = true, silent = true }
        )

        leap.setup(opts)
    end,
}

return M
