-- Shorten function name
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options set function
local opts = { noremap = true, silent = true }
local opts_no_silent = { noremap = true }

-- Show number of matches on search
keymap('n', '/', ':Match ', opts_no_silent)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<S-j>", ":m .+1<CR>==", opts)
keymap("n", "<S-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
  -- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+0<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom Keymaps --
-- Change mode without copy
keymap("n", "cc", '"_cc', opts)
keymap("v", "c", '"_c', opts)

-- Delete word on CTRL + Backspace
keymap("i", "<C-H>", "<C-W>", opts)

-- -- Clear filter
-- keymap("n", "<leader>r", "<cmd>noh<CR>", opts)
--
-- -- New Workspace
-- keymap("n", "<leader>wv", "<cmd>vsp<CR>", opts)
-- keymap("n", "<leader>wh", "<cmd>sp<CR>", opts)

-- SnipRun
keymap("v", "z", "<Plug>SnipRun", opts)

-- Cmdline
keymap('n', ':', '<cmd>FineCmdline<CR>', opts)

-- Format
keymap('n', '<C-f>', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>', opts)
keymap('i', '<C-f>', '<cmd>lua vim.lsp.buf.format{ async = true }<cr>', opts)
