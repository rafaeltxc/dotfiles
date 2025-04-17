local M = {
    "echasnovski/mini.map",
    config = function()
        local map = require("mini.map")
        map.setup({
            integrations = {
                map.gen_integration.builtin_search(),
                map.gen_integration.diagnostic({
                    error = "DiagnosticFloatingError",
                    warn = "DiagnosticFloatingWarn",
                    info = "DiagnosticFloatingInfo",
                    hint = "DiagnosticFloatingHint",
                }),
                map.gen_integration.diff(),
                map.gen_integration.gitsigns({
                    add = "GitSignsAdd",
                    change = "GitSignsChange",
                    delete = "GitSignsDelete",
                }),
            },
            symbols = {
                encode = map.gen_encode_symbols.dot("3x2"),
                scroll_line = "┃",
                scroll_view = "",
            },
            window = {
                focusable = true,
                side = "right",
                show_integration_count = false,
                width = 10,
                winblend = 0,
                zindex = 1,
            },
        })
    end,
}

return M
