return {
    "stevearc/conform.nvim",
    opts = {

        formatters_by_ft = {
            javascript = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            javascriptreact = { "prettier" },
            css = { "prettier" },
            html = { "prettier" },
            json = { "prettier" },
        },
        format_on_save = function(bufnr)
            return {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        end,
    }
}
