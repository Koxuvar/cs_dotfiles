require("nvim-treesitter").setup()

vim.treesitter.language.register("markdown", "markdown")

local parsers = {
    "javascript", "cpp", "rust", "python", "c", "lua", "vim", 
    "vimdoc", "query", "markdown", "markdown_inline", "yaml", 
    "typescript", "html", "css", "tsx"
}

for _, parser in ipairs(parsers) do
    vim.treesitter.language.add(parser)
end
