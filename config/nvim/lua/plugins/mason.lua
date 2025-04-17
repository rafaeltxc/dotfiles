local M = {
    "williamboman/mason.nvim",

    event = "VeryLazy",
    opts = {
      PATH = "prepend",
      ui = {
        border = "rounded",
        width = 0.5,
        height = 0.7,
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        },
        keymaps = {
          toggle_package_expand = "<CR>",
          install_package = "i",
          update_package = "u",
          check_package_version = "c",
          update_all_packages = "U",
          check_outdated_packages = "C",
          uninstall_package = "D",
          cancel_installation = "<C-c>",
          apply_language_filter = "<C-f>",
          toggle_package_install_log = "<CR>",
          toggle_help = "g?",
        },
    }

    },

    config = function(_, opts)
      local mason = require("mason")
      mason.setup(opts)
    end
}

return M
