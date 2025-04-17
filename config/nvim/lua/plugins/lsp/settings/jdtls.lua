return {
    cmd = {
        "/usr/lib/jvm/java-21-openjdk/bin/java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xmx1g",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-javaagent:" .. vim.fn.expand("$HOME/.local/share/nvim/mason/share/jdtls/lombok.jar"),
        "-jar",
        vim.fn.expand(
            "$HOME/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar"
        ),
        "-configuration",
        vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/config_linux"),
        "-data",
        vim.fn.expand("$HOME/.cache/jdtls/workspace"),
    },
    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
    filetypes = { "java", "jsp" },
    settings = {
        java = {
            project = {
                referencedLibraries = {
                    vim.fn.expand("$HOME/.m2/repository/**/*.jar"),
                },
            },
        },
    },
}
