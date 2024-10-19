-- Set all plugins keymaps to be used at plugins/whichkey.lua.

local M = {
  { "<leader>c", "<cmd>bdelete<CR>", desc = "Close buffer" },
  { "<leader>f", "<cmd>Carbon<CR>", desc = "File explorer" },
  { "<leader>e", "<cmd>e!<CR>", desc = "Reload" },

  { "<leader>g", group = "LSP" },
  { "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Declaration" },
  { "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Definition" },
  { "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Implementation" },
  { "<leader>gk", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Impl Hover" },
  { "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Diagnostics" },
  { "<leader>gr", function() require("trouble").toggle("lsp_references") end, desc = "References" },
  { "<leader>gx", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename Variable" },

  { "<leader>h", group = "Git" },
  { "<leader>ha", function() require("gitsigns").diffthis('~') end, desc = "Diff" },
  { "<leader>hb", function() require("gitsigns").blame_line{ full=true } end, desc = "Blame" },
  { "<leader>hd", "<cmd>Gitsigns toggle_deleted<CR>", desc = "Deleted" },

  { "<leader>i", group = "Informative" },
  { "<leader>ii", "<cmd>LspInfo<cr>", desc = "LSP info" },
  { "<leader>ij", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "Next diagnostic" },
  { "<leader>ik", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Previous diagnostic" },
  { "<leader>il", "<cmd>NullLsInfo<cr>", desc = "NullLs info" },
  { "<leader>is", "<cmd>SnipInfo<CR>", desc = "Snip info" },

  { "<leader>m", group = "Managers" },
  { "<leader>ml", "<cmd>Lazy<CR>", desc = "Lazy manager" },

  { "<leader>mm", group = "Mason" },
  { "<leader>mml", "<cmd>MasonLog<CR>", desc = "Mason logs" },
  { "<leader>mmm", "<cmd>Mason<CR>", desc = "Mason manager" },
  { "<leader>mmu", "<cmd>MasonUpdate<CR>", desc = "Mason udate" },
  { "<leader>mt", "<cmd>TSUpdate<CR>", desc = "TS update" },

  { "<leader>q", group = "Neotest" },
  { "<leader>qd", '<esc><cmd>lua require("neotest").run.run({strategy = "dap"})<CR>', desc = "Debug nearest" },
  { "<leader>qf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', desc = "Test file" },
  { "<leader>qn", '<esc><cmd>lua require("neotest").run.run()<CR>', desc = "Test nearest" },
  { "<leader>qs", '<cmd>lua require("neotest").run.stop()<CR>', desc = "Stop test" },
  { "<leader>r", "<cmd>noh<CR>", desc = "Clear filter" },

  { "<leader>s", group = "Spectre" },
  { "<leader>sf", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', desc = "File search" },
  { "<leader>ss", '<cmd>lua require("spectre").toggle()<CR>', desc = "Toggle Spectre" },
  { "<leader>sv", '<esc><cmd>lua require("spectre").open_visual()<CR>', desc = "Open visual" },

  { "<leader>t", group = "Telescope" },
  { "<leader>tb", "<cmd>Telescope buffers<cr>", desc = "Active buffers" },
  { "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Current Buffer" },
  { "<leader>te", "<cmd>Telescope env<cr>", desc = "System env" },
  { "<leader>tf", "<cmd>Telescope find_files<CR>", desc = "Find files" },
  { "<leader>tl", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  { "<leader>tt", "<cmd>Telescope<CR>", desc = "Telescope" },

  { "<leader>w", group = "New workspace" },
  { "<leader>wh", "<cmd>sp<CR>", desc = "Horizontal Window" },
  { "<leader>wv", "<cmd>vsp<CR>", desc = "Vertical Window" },

  { "<leader>x", group = "Troubles" },
  { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document" },
  { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Loclist" },
  { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
  { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Wokspace" },
  { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Troubles" },

  { "<leader>\\", group = "Colors" },
  { "<leader>\\ba", function()
      require('github-theme').setup(require("rtxct.plugins.colorscheme.opts.opts-light"))

      -- reloading
      local current_bg = vim.g.colors_name
      vim.cmd("colorscheme " .. current_bg)
    end, desc = "Bg activate" },
  { "<leader>\\bd", function()
      require('github-theme').setup(require("rtxct.plugins.colorscheme.opts.opts-dark"))

      -- reloading
      local current_bg = vim.g.colors_name
      vim.cmd("colorscheme " .. current_bg)
    end, desc = "Bg deactivate" },
  { "<leader>\\l", "<cmd>colorscheme github_light<cr>", desc = "Light theme" },
  { "<leader>\\d", "<cmd>colorscheme github_dark_default<cr>", desc = "Dark theme" },
}

return M
