local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason.nvim",
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = require("rtxct.utils.mason-ensure-installed"),
        automatic_installation = true,
      },
      config = function(_, opts)
        local msn = require("mason-lspconfig")
        msn.setup(opts)
      end,
    },
  },
  opts = {
    -- Misc
    diagnostics = {
      underline = true,
      update_in_insert = true,
      virtual_text = false,
      --[[ virtual_text = {
        spacing = 2,
        source = "if_many",
        prefix = "",
      }, ]]
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
      severity_sort = true,
    },
    inlay_hints = {
      enabled = true,
    },
    icons = {
      error = " ",
      warn = " ",
      info = " ",
      hint = "󰌵",
    },
  },

  config = function(_, opts)
    require("lspconfig.ui.windows").default_options.border = "rounded"

    vim.fn.sign_define("DiagnosticSignError", { text = opts["icons"].error, texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = opts["icons"].warn, texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = opts["icons"].info, texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = opts["icons"].hint, texthl = "DiagnosticSignHint" })

    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#a3333a", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#d1ab69", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#47a4a6", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#47a4a6", bg = "NONE" })

    -- Setup
    if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
      opts.diagnostics.virtual_text.prefix = vim.fn.has("nvim-0.10.0") == 0 and ""
        or function(diagnostic)
          for d, icon in pairs(opts["icons"]) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
    end
    vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

    -- Capabilities
    local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      has_cmp and cmp_nvim_lsp.default_capabilities() or {},
      opts.capabilities or {}
    )

    -- Handlers
    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
      }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
      }),
    }

    local servers = require("rtxct.utils.mason-ensure-installed")
    if #servers > 0 then
      local setup = function(server)
        local server_opts = {
          handlers = handlers,
          capabilities = vim.deepcopy(capabilities),
        }

        local require_ok, custom_opts = pcall(require, "rtxct.plugins.lsp.settings." .. server)
        if require_ok then
          server_opts = vim.tbl_deep_extend("force", custom_opts, server_opts)
        end

        require("lspconfig")[server].setup(server_opts)
      end

      for _, server in ipairs(servers) do
        setup(server)
      end
    end
  end,
}

return M
