-- Set all plugins keymaps to be used at plugins/whichkey.lua.

local opts = { noremap = true, silent = true }

local M = {
-- Noh
  r = { "<cmd>noh<CR>", "Clear filter" },

-- New Workspace
  w = {
    name = "New workspace",
    v = { "<cmd>vsp<CR>", "Vertical Window", opts },
    h = { "<cmd>sp<CR>", "Horizontal Window", opts },
  },

-- Close buffer
  c = { "<cmd>bdelete<CR>", "Close current buffer", opts },

  -- SnipRun
  q = { "<Plug>SnipRun", "Run snip", opts },

-- Plugins management
  m = {
    name = "Managers",

    -- Mason
    m = {
      name = "Mason",
      m = { "<cmd>Mason<CR>", "Mason manager", opts },
      u = { "<cmd>MasonUpdate<CR>", "Mason udate", opts },
      l = { "<cmd>MasonLog<CR>", "Mason logs", opts },
    },

    -- Treesitter
    t = { "<cmd>TSUpdate<CR>", "TS update", opts },

    -- Lazy
    l = { "<cmd>Lazy<CR>", "Lazy manager", opts },
  },

  -- Carbon Tree
  f = { "<cmd>Carbon<CR>", "File explorer", opts },

-- Telescope
  t = {
    name = "Telescope",
    t = { "<cmd>Telescope<CR>", "Telescope", opts },
    f = { "<cmd>Telescope find_files<CR>", "Find files", opts },
    c = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer", opts },
    l = { "<cmd>Telescope live_grep<cr>", "Live grep", opts },
    b = { "<cmd>Telescope buffers<cr>", "Active buffers", opts },
    e = { "<cmd>Telescope env<cr>", "System env", opts },
  },

-- Spectre
  s = {
    name = "Spectre",
    s = { "<cmd>lua require(\"spectre\").toggle()<CR>", "Toggle Spectre", opts },
    v = { "<esc><cmd>lua require(\"spectre\").open_visual()<CR>", "Open visual", opts },
    f = { "<cmd>lua require(\"spectre\").open_file_search({select_word=true})<CR>", "File search", opts },
  },

-- Trouble
  x = {
    name = "Troubles",
    x = { "<cmd>TroubleToggle<cr>", "Troubles", opts },
    w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Wokspace", opts },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document", opts },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix", opts },
    l = { "<cmd>TroubleToggle loclist<cr>", "Loclist", opts },
  },

-- Harpoon
  --[[ h = {
    name = "Harpoon",
    h = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Toggle Harpoon" },
    a = { function() harpoon:list():append() end, "Add to list" },
    p = { function() harpoon:list():prepend() end, "Prepend from list" },
  }, ]]

-- LSP
  g = {
    name = "LSP",
    D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration", opts },
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition", opts },
    r = { function() require("trouble").toggle("lsp_references") end, "References", opts },
    k = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Impl Hover", opts },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation", opts },
    l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Diagnostics", opts },
  },

-- Formatting
  i = {
    name = "Informative",
    i = { "<cmd>LspInfo<cr>", "LSP info", opts },
    l = { "<cmd>NullLsInfo<cr>", "NullLs info", opts },
    s = { "<cmd>SnipInfo<CR>", "Snip info" },
    j = { "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "Next diagnostic", opts },
    k = { "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "Previous diagnostic", opts },
  },

  h = {
    d = { "<cmd>Gitsigns diffthis<CR>", "Git diff" },
    x = { "<cmd>Gitsigns toggle_deleted<CR>", "Deleted chunk" }
  }
}

return M
