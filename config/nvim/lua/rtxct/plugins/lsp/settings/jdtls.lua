return {
	cmd = {
    "jdtls",
    "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "~/.local/share/nvim/mason/share/jdtls/lombok.jar"),
  },
  filetypes = {'java', 'jsp'}
}
