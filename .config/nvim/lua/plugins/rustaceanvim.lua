return {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    init = function()
        vim.g.rustaceanvim = {
            sever = {
                on_attach = function(_, bufnr)
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                end,
            },
        }
    end,
}
