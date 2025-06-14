local M = {
    "nvim-pack/nvim-spectre",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    opts = {
        open_cmd = "belowright vnew",
        live_update = true,
        highlight = {
            ui = "String",
            search = "DiffChange",
            replace = "DiffDelete",
        },
        mapping = {
            ["toggle_line"] = {
                map = "dd",
                cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
                desc = "toggle item",
            },
            ["enter_file"] = {
                map = "<cr>",
                cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
                desc = "open file",
            },
            ["send_to_qf"] = {
                map = "<leader>q",
                cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
                desc = "send all items to quickfix",
            },
            ["replace_cmd"] = {
                map = "<leader>c",
                cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
                desc = "input replace command",
            },
            ["show_option_menu"] = {
                map = "<leader>o",
                cmd = "<cmd>lua require('spectre').show_options()<CR>",
                desc = "show options",
            },
            ["run_current_replace"] = {
                map = "<leader>rc",
                cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                desc = "replace current line",
            },
            ["run_replace"] = {
                map = "<leader>R",
                cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                desc = "replace all",
            },
            ["change_view_mode"] = {
                map = "<leader>v",
                cmd = "<cmd>lua require('spectre').change_view()<CR>",
                desc = "change result view mode",
            },
            ["change_replace_sed"] = {
                map = "trs",
                cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
                desc = "use sed to replace",
            },
            ["change_replace_oxi"] = {
                map = "tro",
                cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
                desc = "use oxi to replace",
            },
            ["toggle_live_update"] = {
                map = "tu",
                cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
                desc = "update when vim writes to file",
            },
            ["toggle_ignore_case"] = {
                map = "ti",
                cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                desc = "toggle ignore case",
            },
            ["toggle_ignore_hidden"] = {
                map = "th",
                cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
                desc = "toggle search hidden",
            },
            ["resume_last_search"] = {
                map = "<leader>l",
                cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
                desc = "repeat last search",
            },
        },
        is_block_ui_break = true,
    },

    config = function(_, opts)
        local sp = require("spectre")
        sp.setup(opts)
    end,
}

return M
