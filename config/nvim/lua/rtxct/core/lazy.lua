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
    {import = "rtxct.plugins"},
    {import = "rtxct.plugins.lsp"},
    {import = "rtxct.plugins.dap"},
    {import = "rtxct.plugins.colorscheme"},
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
        disable_plugins = {
        },
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
      icons = {
        cmd = " ",
        config = "",
        event = "",
        ft = " ",
        init = " ",
        import = " ",
        keys = " ",
        lazy = "󰒲 ",
        loaded = "●",
        not_loaded = "○",
        plugin = " ",
        runtime = " ",
        require = "󰢱 ",
        source = " ",
        start = "",
        task = "✔ ",
        list = {
          "●",
          "➜",
          "★",
          "‒",
        },
      },
  },
})
