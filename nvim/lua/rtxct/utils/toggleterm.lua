local toggleterm_status_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status_ok then
	vim.notify('Could not load "Toggleterm" package')
	return
end

toggleterm.setup({
	shell = "zsh",
	hide_numbers = true,
	autochdir = true,
	close_on_exit = true,
	open_mapping = [[<c-\>]],
	direction = "float",
	float_opts = {
		border = "curved",
		width = 60,
		height = 20,
	},
})
