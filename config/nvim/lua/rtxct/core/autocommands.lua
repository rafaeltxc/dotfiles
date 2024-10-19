-- create an augroup for autocommands
local group = vim.api.nvim_create_augroup("autocmdsgroup", { clear = true })

-- Utility function to create autocommands
local function create_autocmd(events, opts)
	opts = vim.tbl_extend("force", opts, { group = group })
	vim.api.nvim_create_autocmd(events, opts)
end

-- Highlight text on yank
create_autocmd("TextYankPost", {
	desc = "highlight text on yank",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "Search",
			timeout = 250,
			on_visual = true,
		})
	end,
})

-- Jump to the last position when reopening a file
create_autocmd("BufWinEnter", {
	desc = "jump to the last position when reopening a file",
	pattern = "*",
	command = [[ if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
})

-- Remove whitespaces on save
create_autocmd("BufWritePre", {
	desc = "remove whitespaces on save",
	pattern = "*",
	command = "%s/\\s\\+$//e",
})

-- Prevent auto-commenting on a new line
create_autocmd({ "BufEnter", "FileType" }, {
	desc = "don't auto comment new line",
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- Auto-resize split windows
create_autocmd("VimResized", {
	desc = "auto resize splited windows",
	pattern = "*",
	command = "tabdo wincmd =",
})

-- Clear the last used search pattern
create_autocmd("BufWinEnter", {
	desc = "clear the last used search pattern",
	pattern = "*",
	command = "let @/ = ''",
})

-- Reload config file on change
create_autocmd("BufWritePost", {
	desc = "Reload current buffer on any change",
	pattern = vim.env.MYVIMRC,
	command = "silent source %",
})

-- Highlight word under the cursor
create_autocmd("CursorMoved", {
	desc = "Highlight every word equals to the current word under the cursor",
	pattern = "*",
	command = "silent EqualWords",
})
