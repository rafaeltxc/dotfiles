local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- plugins (some of the plugins keymap will be on its own lua file)
-- PluginPacker
keymap("n", "<leader>ms", "<cmd>PackerStatus<CR>", opts)
keymap("n", "<leader>mS", "<cmd>PackerSync<CR>", opts)
keymap("n", "<leader>mI", "<cmd>PackerInstall<CR>", opts)
keymap("n", "<leader>mC", "<cmd>PackerClean<CR>", opts)
keymap("n", "<leader>mU", "<cmd>PackerUpdate<CR>", opts)
-- Telescope
keymap("n", "<leader>tl", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<leader>tt", "<cmd>Telescope<CR>", opts)
keymap("n", "<leader>tc", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>tf", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", "<cmd>Telescope git_files<CR>", opts)
keymap("n", "<leader>td", "<cmd>Telescope diagnostics<CR>", opts)
-- LspConfig
keymap("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>gK", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "<leader>gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
keymap("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
keymap("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
-- Mason
keymap("n", "<leader>el", "<cmd>Mason<CR>", opts)
keymap("n", "<leader>eu", "<cmd>MasonUpdate<CR>", opts)
-- NvimTree
keymap("n", "<leader>f", "<cmd>NvimTreeToggle<CR>", opts)
-- Multi cursor
vim.g.VM_maps = {
	["Select All"] = "<C-b>",
	["Find Under"] = "<C-n>",
	["Select Cursor Down"] = "<C-Down>",
	["Select Cursor Up"] = "<C-Up>",
}
-- Bufferline
keymap("n", "<leader>c", "<cmd>Bdelete<CR>", opts)
-- FineCmdline
keymap("n", ":", "<cmd>FineCmdline<CR>", opts)

-- Custom  --
-- Delete and insert mode without copy
keymap("n", "cc", '"_cc', opts)
keymap("v", "c", '"_c', opts)
-- Delete word on CTRL + Backspace
keymap("i", "<C-H>", "<C-W>", opts)
-- Copy to clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
-- Paste from clipboard
keymap("n", "<leader>p", '"+p', opts)
keymap("v", "<leader>p", '"+p', opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

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

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
