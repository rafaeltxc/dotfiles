local indentline_status_ok, indentline = pcall(require, "ibl")
if not indentline_status_ok then
  vim.notify("Could not load \"Indent Blankline\" package")
  return
end

vim.opt.list = true
vim.opt.listchars:append "space:."
-- vim.opt.listchars:append "eol:↴"

indentline.setup {

  -- Colorfull lines
  -- char_highlight_list = {
  --   "IndentBlanklineIndent1",
  --   "IndentBlanklineIndent2",
  --   "IndentBlanklineIndent3",
  --   "IndentBlanklineIndent4",
  --   "IndentBlanklineIndent5",
  --   "IndentBlanklineIndent6",
  -- },

  -- Two color lines
  -- char = "",
  -- char_highlight_list = {
  --       "IndentBlanklineIndent1",
  --       "IndentBlanklineIndent2",
  -- },
  -- space_char_highlight_list = {
  --       "IndentBlanklineIndent1",
  --       "IndentBlanklineIndent2",
  -- },
}
