local M = {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvimtools/hydra.nvim",
    },
    opts = {
        hint_config = false,
    },
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
        {
            mode = { "v", "n" },
            "<C-n>",
            "<cmd>MCstart<cr>",
            desc = "Create a selection for selected text or word under the cursor",
        },
    },
    config = function(_, opts)
        local multi = require("multicursors")
        multi.setup(opts)
    end,
}

return M
