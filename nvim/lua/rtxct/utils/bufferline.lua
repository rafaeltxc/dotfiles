local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  vim.notify("Could not load \"BufferLine\" package")
  return
end

bufferline.setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    numbers = "none",
    close_command = "Bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = nill, -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
    middle_mouse_command = "Bdelete! %d",          -- can be a string | function, | false see "Mouse actions"
    indicator = {
        icon = '', -- this should be omitted if indicator style is not 'icon'
        style = 'icon',
    },
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 20,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 25,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
        return "("..count.. ")"
    end,
    diagnostics_update_in_insert = true,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      }
    },
    color_icons = false,
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
    separator_style = "none",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
        enabled = true,
        delay = 200,
        reveal = {'close'}
    },
  }
}

