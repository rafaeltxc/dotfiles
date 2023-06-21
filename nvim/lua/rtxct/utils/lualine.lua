local lualine_status_ok, lualine = pcall(require, "lualine")
if not lualine_status_ok then
  vim.notify("Could not load \"LuaLine\" package")
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'nord',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {
        'branch',
        icon = ''
      }
    },
    lualine_c = {
      'filetype',
      {
        'filename',
        file_status = true,
        path = 1,
        shorting_target = 30,
        symbols = {
            modified = '',      -- Text to show when the file is modified.
            readonly = '',      -- Text to show when the file is non-modifiable or readonly.
            unnamed = '[No Name]', -- Text to show for unnamed buffers.
            newfile = '',     -- Text to show for newly created file before first write
          }
      }
    },
    lualine_x = {'searchcount'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
