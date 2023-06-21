local indentline_status_ok, indentline = pcall(require, "indent_blankline")
if not indentline_status_ok then
  vim.notify("Could not load \"Indent Blankline\" package")
  return
end

vim.opt.list = true
vim.opt.listchars:append "space:."
-- vim.opt.listchars:append "eol:↴"

-- Colorfull lines
-- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

-- Two color lines
-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

indentline.setup {
  show_current_context = true,
  show_current_context_start = true,
  show_end_of_line = true,
  space_char_blankline = " ",

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
