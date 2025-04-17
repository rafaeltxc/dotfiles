-- Set all plugins keymaps to be used at plugins/whichkey.lua.
local M = {
    -- Navigation
    { "<leader>l",  group = "Navigation" },
    { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<CR>",    desc = "Declaration" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>",     desc = "Definition" },
    { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
    { "<leader>lk", "<cmd>lua vim.lsp.buf.hover()<CR>",          desc = "Documentation" },
    { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>",  desc = "Diagnostics" },
    {
        "<leader>lr",
        function()
            require("trouble").toggle("lsp_references")
        end,
        desc = "References",
    },

    -- Git
    { "<leader>g",  group = "Git" },
    {
        "<leader>ga",
        function()
            require("gitsigns").diffthis("~")
        end,
        desc = "Diff",
    },
    {
        "<leader>gb",
        function()
            require("gitsigns").blame_line({ full = true })
        end,
        desc = "Blame",
    },
    { "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Deleted" },

    -- Utilities
    { "<leader>u",  group = "Utilities" },
    { "<leader>ui", "<cmd>LspInfo<cr>",                 desc = "LSP Info" },
    { "<leader>ul", "<cmd>NullLsInfo<cr>",              desc = "NullLs Info" },
    { "<leader>us", "<cmd>SnipInfo<CR>",                desc = "Snip Info" },
    { "<leader>un", "<cmd>Noice pick<CR>",              desc = "Messages" },
    {
        "<leader>up",
        "<cmd>MarkdownPreviewToggle<CR>",
        desc = "Markdown Preview",
    },
    {
        "<leader>um",
        "<cmd>lua require('mini.map').toggle()<CR>",
        desc = "MiniMap",
    },

    -- Managers
    { "<leader>m",   group = "Managers" },
    { "<leader>ml",  "<cmd>Lazy<CR>",                                                    desc = "Lazy Manager" },
    { "<leader>mt",  "<cmd>TSUpdate<CR>",                                                desc = "Tree Sitter Update" },

    { "<leader>mm",  group = "Mason" },
    { "<leader>mml", "<cmd>MasonLog<CR>",                                                desc = "Mason Logs" },
    { "<leader>mmm", "<cmd>Mason<CR>",                                                   desc = "Mason Manager" },

    -- Testing
    { "<leader>q",   group = "Testing" },
    { "<leader>qd",  '<esc><cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', desc = "Debug Nearest" },
    { "<leader>qn",  '<esc><cmd>lua require("neotest").run.run()<CR>',                   desc = "Test Nearest" },
    { "<leader>qf",  '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>',      desc = "Test File" },
    { "<leader>qs",  '<cmd>lua require("neotest").run.stop()<CR>',                       desc = "Stop Test" },

    -- Refactor
    { "<leader>r",   group = "Refactoring" },
    { "<leader>rr",  "<cmd>lua vim.lsp.buf.rename()<CR>",                                desc = "Rename Variable" },
    {
        "<leader>ro",
        '<cmd>lua require("oil").toggle_float()<CR>',
        desc = "File Refactor",
    },
    { "<leader>rs", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },

    -- Debuging
    { "<leader>D",  group = "Debuging" },
    { "<leader>Dd", "<cmd>DapToggleBreakpoint<cr>",             desc = "Toggle Breakpoint" },
    {
        "<leader>Db",
        function()
            vim.ui.input({ prompt = "Condition: " }, function(input)
                require("dap").toggle_breakpoint(input)
            end)
        end,
        desc = "Cond. Breakpoint",
    },
    {
        "<leader>Dc",
        "<cmd>lua require('telescope').extensions.dap.commands()<cr>",
        desc = "Commands",
    },
    {
        "<leader>Dl",
        "<cmd>lua require('telescope').extensions.dap.list_breakpoints()<cr>",
        desc = "List Breakpoints",
    },
    {
        "<leader>Dv",
        "<cmd>lua require('telescope').extensions.dap.variables()<cr>",
        desc = "Variables",
    },
    {
        "<leader>Df",
        "<cmd>lua require('telescope').extensions.dap.frames()<cr>",
        desc = "Frames",
    },
    {
        "<leader>Du",
        "<cmd>lua require('dapui').toggle()<cr>",
        desc = "Toggle UI",
    },

    -- Fuzzy Finder
    { "<leader>f",  group = "Finder" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>",                        desc = "Active Buffers" },
    { "<leader>fc", "<cmd>Telescope current_buffer_fuzzy_find<CR>",      desc = "Current Buffer" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>",                     desc = "Find Files" },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>",                      desc = "Live Grep" },
    { "<leader>fu", "<cmd>Telescope undo<cr>",                           desc = "Modification History" },
    { "<leader>fo", "<cmd>Telescope projects<cr>",                       desc = "Recent Projects" },

    -- Workspace
    { "<leader>w",  group = "Workspace" },
    { "<leader>wh", "<cmd>sp<CR>",                                       desc = "Horizontal Window" },
    { "<leader>wv", "<cmd>vsp<CR>",                                      desc = "Vertical Window" },

    -- Diagnostics
    { "<leader>d",  group = "Diagnostics" },
    { "<leader>dj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "Next Diagnostic" },
    { "<leader>dk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Previous Diagnostic" },
    { "<leader>dp", "<cmd>Trouble diagnostics<cr>",                      desc = "Problems" },
    { "<leader>dq", "<cmd>Trouble quickfix<cr>",                         desc = "Quickfix" },

    -- Themes
    -- { "<leader>b",  group = "Background" },
    -- { "<leader>bl", "<cmd>colorscheme github_light<cr>",                 desc = "Light theme" },
    -- { "<leader>bd", "<cmd>colorscheme github_dark_default<cr>",          desc = "Dark theme" },
    --
    -- { "<leader>bb", group = "Transparency" },
    -- {
    --     "<leader>bba",
    --     function()
    --         require("github-theme").setup(require("plugins.colorscheme.opts.opts-githublight"))
    --
    --         -- reloading
    --         local current_bg = vim.g.colors_name
    --         vim.cmd("colorscheme " .. current_bg)
    --     end,
    --     desc = "Active",
    -- },
    --
    -- {
    --     "<leader>bbi",
    --     function()
    --         require("github-theme").setup(require("plugins.colorscheme.opts.opts-githubdark"))
    --
    --         -- reloading
    --         local current_bg = vim.g.colors_name
    --         vim.cmd("colorscheme " .. current_bg)
    --     end,
    --     desc = "Inactive",
    -- },
}

return M
