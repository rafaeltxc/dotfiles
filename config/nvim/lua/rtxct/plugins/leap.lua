local M = {
  "ggandor/leap.nvim",
  event = "VeryLazy",
  dependencies = {
    "tpope/vim-repeat",
  },
  opts = {
    max_phase_one_targets = nil,
    highlight_unlabeled_phase_one_targets = false,
    max_highlighted_traversal_targets = 10,
    case_sensitive = false,
    equivalence_classes = { " \t\r\n" },
    substitute_chars = {},
    safe_labels = "sfnut/SFNLHMUGTZ?",
    labels = "sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?",
    special_keys = {
      next_target = "<enter>",
      prev_target = "<tab>",
      next_group = "<space>",
      prev_group = "<tab>",
      multi_accept = "<enter>",
      multi_revert = "<backspace>",
    },
  },

  config = function(_, opts)
    require('leap').add_default_mappings()
    local leap = require("leap")

    require("leap").add_repeat_mappings(">", "<", {
      relative_directions = true,
      modes = { "n" },
    })

    leap.setup(opts)
  end,
}

return M
