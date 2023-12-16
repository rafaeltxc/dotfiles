local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 1,
	completeopt = { "menuone", "noselect" },
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	mousemoveevent = true,
	pumheight = 10,
	showmode = true,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	timeout = true,
	timeoutlen = 200,
	undofile = true,
	updatetime = 300,
	writebackup = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = false,
	guicursor = "",
	number = true,
	relativenumber = true,
	numberwidth = 2,
	signcolumn = "yes",
	wrap = false,
	linebreak = true,
	scrolloff = 15,
	sidescrolloff = 8,
	guifont = "JetBainsMono Nerd Font",
	whichwrap = "bs<>[]hl",
	laststatus = 0,
	tabline = "%t",
	list = true,
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.opt.listchars:append("space:.")
-- vim.opt.listchars:append "eol:↴"

for key, value in pairs(options) do
	vim.opt[key] = value
end
