require("toggleterm").setup {
    size = 15,
    direction = 'horizontal',
    open_mapping = [[<c-\>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    hide_numbers = true,    -- hide the number column in toggleterm buffers
    autochdir = false,      -- when neovim changes it current directory the terminal will change it's own when next it's opened
    start_in_insert = true,
    close_on_exit = true,   -- close the terminal window when the process exits
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
}
