local dash_status_ok, dash = pcall(require, "dashboard")
if not dash_status_ok then
  vim.notify("Could not load \"Dashboard\" package")
  return
end

dash.setup {
  theme = 'hyper', --  theme is doom and hyper default is hyper
  disable_move,    --  default is false disable move keymap for hyper
  shortcut_type,   --  shorcut type 'letter' or 'number'
  change_to_vcs_root, -- default is false,for open file in hyper mru. it will change to the root of vcs
  config = {
    center = {
    {
      icon = '',
      icon_hl = 'group',
      desc = 'description',
      desc_hl = 'group',
      key = 'shortcut key in dashboard buffer not keymap !!',
      key_hl = 'group',
      action = '',
    },
  },
  footer = {},
  },    --  config used for theme
  hide = {
    statusline,    -- hide statusline default is true
    tabline,       -- hide the tabline
    winbar,        -- hide winbar
  },
  preview = {
    command,       -- preview command
    file_path,     -- preview file path
    file_height,   -- preview file height
    file_width,    -- preview file width
  },
}
