-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Function Shortens
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- NeoVim Keymaps --
-- Navigate windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("n", "<S-Right>", ":bnext<CR>", opts)
keymap("n", "<S-Letf>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<S-j>", ":m .+1<CR>==", opts)
keymap("n", "<S-k>", ":m .-2<CR>==", opts)

keymap("n", "<S-Down>", ":m .+1<CR>==", opts)
keymap("n", "<S-Up>", ":m .-2<CR>==", opts)

keymap("v", "<S-j>", ":m .+1<CR>==", opts)
keymap("v", "<S-k>", ":m .-2<CR>==", opts)

keymap("v", "<S-Down>", ":m .+1<CR>==", opts)
keymap("v", "<S-Up>", ":m .-2<CR>==", opts)

keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-k>", ":move '<-2<CR>gv-gv", opts)

keymap("x", "<S-Down>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<S-Up>", ":move '<-2<CR>gv-gv", opts)

-- Move to sides
keymap("n", "t", "b", opts)
keymap("n", "e", "w", opts)

-- Insert mode exit
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

keymap("i", "nn", "<ESC>", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Modify pasting
keymap("v", "p", '"_dP', opts)

-- Change mode without copy
keymap("n", "cc", '"_cc', opts)
keymap("v", "c", '"_c', opts)

-- Close current buffer
keymap("n", "<C-w>", "<cmd>bd<CR>", opts)

-- Select entire word
keymap("n", "<S-w>", "viw", opts)

-- Clear filter
keymap("n", "<C-c>", "<cmd>noh<CR>", opts)

-- Reload Buffer
keymap("n", "<C-e>", "<cmd>e!<CR>", opts)

-- Delete word as out of NeoVim
keymap("i", "<C-BS>", "<C-W>", opts)
keymap("i", "<C-Del>", "<C-O>dE", opts)

-- Plugins Keymaps --
-- File Explorer (Carbon)
keymap("n", "<C-f>", "<cmd>Carbon<CR>", opts)

-- SnipRun
keymap("v", "x", "<Plug>SnipRun", opts)

-- Cmdline
keymap("n", ":", "<cmd>FineCmdline<CR>", opts)
keymap("v", ":", "<cmd>FineCmdline<CR>", opts)

-- Format code
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
