return {
	cmd = { "/home/rtxct/.local/share/nvim/mason/bin/jdtls" },
	init_options = {
		workspace = true,
		bundles = {
			vim.fn.glob("~/.m2/repository/org/projectlombok/lombok/1.18.30/lombok-1.18.30.jar"),
		},
		extendedClientCapabilities = {
			classFileContentsSupport = true,
		},
	},
}
