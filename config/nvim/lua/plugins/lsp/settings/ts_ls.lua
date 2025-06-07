return {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- Set buffer-local editor options
        vim.bo[bufnr].tabstop = 2
        vim.bo[bufnr].shiftwidth = 2
        vim.bo[bufnr].softtabstop = 2
        vim.bo[bufnr].expandtab = true
    end,
}
