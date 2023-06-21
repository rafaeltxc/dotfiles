local cmdline_status_ok, cmdline = pcall(require, "fine-cmdline")
if not cmdline_status_ok then
  vim.notify("Could not load \"CmdLine\" package")
  return
end

local fn = cmdline.fn

cmdline.setup({
  cmdline = {
    enable_keymaps = true,
    smart_history = true,
    prompt = ':'
  },
  popup = {
    position = {
      row = '50%',
      col = '50%',
    },
    size = {
      width = '45%',
    },
    border = {
      style = 'shadow',
      padding = {
        top = 2,
        right = 2,
        bottom = 2,
        left = 5
      }
    },
    win_options = {
      winhighlight = 'Normal:Normal',
    },
  },
  hooks = {
    before_mount = function(input)
      vim.keymap.set('i', '<Esc>', '<cmd>stopinsert<cr>', {buffer = input.bufnr})
    end,
    after_mount = function(input)
      -- code
    end,
    set_keymaps = function(imap, feedkeys)
      imap('<Esc>', fn.close)
      imap('<C-c>', fn.close)

      imap('<Up>', fn.up_search_history)
      imap('<Down>', fn.down_search_history)
    end
  }
})
