return {
  options = {
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled',
    hide_end_of_buffer = false,
    hide_nc_statusline = false,
    transparent = true,
    terminal_colors = false,
    dim_inactive = false,
    module_default = false,
    styles = {
      comments = 'NONE',
      functions = 'NONE',
      keywords = 'NONE',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = {
        match_paren = false,
        visual = false,
        search = false,
    },
    darken = {
        floats = false,
        sidebars = {
          enable = false,
          list = {},
        },
    },
  },

  groups = {
    all = {
      TabLineFill = { bg = 'NONE' },
    },
  },
}
