local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "rtxct.plugins.lsp.mason"
require("rtxct.plugins.lsp.handlers").setup()
require "rtxct.plugins.lsp.null-ls"
