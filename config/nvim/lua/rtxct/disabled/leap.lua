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

  config = function(_, opts)
    require('leap').create_default_mappings()
    local leap = require("leap")

    leap.setup(opts)
  end,
}

return M
