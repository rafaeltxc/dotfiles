return {
	cmd = {
    "jdtls",
    "--jvm-arg=" .. string.format("-javaagent:%s", vim.fn.expand "$MASON/share/jdtls/lombok.jar"),
  },
}
