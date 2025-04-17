local home_dir = os.getenv("HOME")

local M = {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = "cd " .. home_dir .. "/.local/share/nvim/lazy/markdown-preview.nvim && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
}

return M
