local M = {
    "j-hui/fidget.nvim",
    lazy = false,
    opts = {
        progress = {
            ignore_empty_message = true,
            display = {
                done_ttl = 1,
                done_icon = "",
            },
        },
        notification = {
            view = {
                stack_upwards = false,
            },
            window = {
                winblend = 0,
            },
        },
    },
    config = function(_, opts)
        require("fidget").setup(opts)
    end,
}

return M
