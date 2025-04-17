local M = {
    "ahmedkhalf/project.nvim",
    lazy = false,
    opts = {
        patterns = { ".git", ".gitignore", ".env", " _darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "init.lua" },
        show_hidden = true,
    },
    config = function(_, opts)
        require("project_nvim").setup(opts)
    end,
}

return M
