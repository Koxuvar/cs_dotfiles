local wk = require('which-key')

wk.add({
    {"<leader>kk", desc = "vim Ex", mode = "n"},
    {"<leader>gs", desc = "Git", mode = "n"},
    {"<leader>a", desc = "Harpoon Add File", mode = "n"},
    {"<leader>fg", desc = "search git commits", mode = "n"},
    {"<leader>ff", desc = "Find file", mode = "n"},
    {"<leader>fs", desc = "search with grep", mode = "n"},
    {"<leader>fr", desc = "Find file with frecency", mode = "n"},
    {"<leader>uu", desc = "Toggle undo tree", mode = "n"},
    {"<leader>bb", desc = "Toggle buffer tree", mode = "n"},
    {"<leader>bf", desc = "Toggle file tree", mode = "n"},
    {"<leader>md", desc = "Render Markdown", mode = "n"},

})
