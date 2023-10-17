local servers = {
  "lua_ls",
  "jsonls",
  "tsserver",
  "jdtls",
  "eslint",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  vim.notify("Could not load \"Mason\" package")
  return
end

local masonlsp_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not masonlsp_status_ok then
  vim.notify("Could not load \"mason-lspconfig\" package")
  return
end

mason.setup(settings)
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("Could not load \"LspConfig\" package")
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    -- on_attach = require("rtxct.plugins.lsp.handlers").on_attach,
    capabilities = require("rtxct.plugins.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  local require_ok, conf_opts = pcall(require, "rtxct.plugins.lsp.settings." .. server)
  if require_ok then
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
