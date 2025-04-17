local M = {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "VeryLazy" },
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function()
                local move = require("nvim-treesitter.textobjects.move")
                local configs = require("nvim-treesitter.configs")
                for name, fn in pairs(move) do
                    if name:find("goto") == 1 then
                        move[name] = function(q, ...)
                            if vim.wo.diff then
                                local config = configs.get_module("textobjects.move")[name]
                                for key, query in pairs(config or {}) do
                                    if q == query and key:find("[%]%[][cC]") then
                                        vim.cmd("normal! " .. key)
                                        return
                                    end
                                end
                            end
                            return fn(q, ...)
                        end
                    end
                end
            end,
        },
    },
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = require("utils.treesitter-ensure-installed")
    },

    config = function(_, opts)
        local tst = require("nvim-treesitter.configs")
        tst.setup(opts)
    end,
}

return M
