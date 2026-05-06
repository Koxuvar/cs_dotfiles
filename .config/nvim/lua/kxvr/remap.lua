vim.g.mapleader = " "

--qol move highlighted text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- moves f3 to conform.nvim instead of standard formatting
vim.keymap.set({ "n", "x" }, "<F3>", function()
    require("conform").format({ async = true, lsp_fallback = true })
end)

--fugitive mapping
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- removing new v0.12 maps for lsp stuff
-- vim.keymap.del("n", "grr")
-- vim.keymap.del("n", "gra")
-- vim.keymap.del("n", "gri")
-- vim.keymap.del("n", "grn")
-- vim.keymap.del("n", "grt")
-- vim.keymap.del("n", "grx")

vim.keymap.set("i", "<C-l>", function()
    local closers = { ")", "]", "}", "'", '"', "`" }
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local next_char = line:sub(col + 1, col + 1)
    if vim.tbl_contains(closers, next_char) then
        vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col + 1 })
    end
end, { desc = "Jump out of closing pair" })
