local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_commits, {})
vim.keymap.set('n', '<leader>fs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<leader>fr', function()
    vim.cmd("Telescope frecency")
end)

require("telescope").setup {
    extensions = {
        frecency = {
            auto_validate = false,
            matcher = "fuzzy",
            path_display = { "filename_first" },
        },
    },
}
