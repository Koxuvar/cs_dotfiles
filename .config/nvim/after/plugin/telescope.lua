local builtin = require("telescope.builtin")


vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})

vim.keymap.set("n", "<leader>en", function()
    builtin.find_files {
        cwd = vim.fn.stdpath('config')
    }
end)

vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

vim.keymap.set("n", "<leader>fr", function()
    vim.cmd("Telescope frecency")
end)

require("telescope").setup {

    extensions = {
        frecency = {
            auto_validate = false,
            matcher = "fuzzy",
            path_display = { "filename_first" },
        },
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },

    },
}
