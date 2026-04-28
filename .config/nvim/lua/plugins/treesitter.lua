return
{
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = function()
        require("nvim-treesitter").install(parsers)
    end,
}
