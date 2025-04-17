local M = {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,

    config = function()
      require('github-theme').setup(require("plugins.colorscheme.opts.opts-githubdark"))
      -- vim.cmd('colorscheme github_dark_default')
    end,
}

return M
