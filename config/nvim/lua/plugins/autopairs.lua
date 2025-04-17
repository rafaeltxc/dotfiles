local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        disable_filetype = { "TelescopePrompt", "spectre_panel" },
        ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
        disable_in_macro = true,
        disable_in_visualblock = false,
        disable_in_replace_mode = true,
        enable_check_bracket_line = false,
        enable_bracket_in_quote = true,
        check_ts = true,
    },

    config = function(_, opts)
        local Rule = require("nvim-autopairs.rule")
        local ap = require("nvim-autopairs")

        local cond = require("nvim-autopairs.conds")

        ap.setup(opts)
        ap.add_rules({
            Rule("<", ">"):with_pair(cond.not_before_text(" ")):with_pair(cond.not_inside_quote()),
        })
    end,
}

return M
