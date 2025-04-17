local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins" },
    { import = "plugins.colorscheme" },
    { import = "plugins.lsp" },
}, {
    defaults = {
        lazy = true,
        cond = true,
    },
    checker = {
        enabled = false,
        notify = false,
        check_pinned = false,
    },
    change_detection = {
        enabled = false,
    },
    build = {
        warn_on_override = true,
    },
    readme = {
        enabled = true,
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        skip_if_doc_exists = true,
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true,
        rtp = {
            reset = true,
            disable_plugins = {},
        },
    },
    ui = {
        border = "rounded",
        size = {
            width = 0.5,
            height = 0.7,
        },
        title = "Lazy Manager",
        title_pos = "center",
        pills = true,
    },
})
