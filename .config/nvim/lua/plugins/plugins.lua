return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
    },
    { "nvim-treesitter/playground" },
    { "ThePrimeagen/harpoon" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        }
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
    },
    -- {
    --     "goolord/alpha-nvim",
    --     config = function()
    --         require "alpha".setup(require "alpha.themes.dashboard"
    --             .config)
    --     end
    -- },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function() require("telescope").load_extension "frecency" end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "echasnovski/mini.icons"
        },
    },
    {
        "echasnovski/mini.icons",
        version = false
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        }
    },
    {
        "sphamba/smear-cursor.nvim",

        opts = {
            -- Smear cursor when switching buffers or windows.
            smear_between_buffers = true,

            -- Smear cursor when moving within line or to neighbor lines.
            smear_between_neighbor_lines = true,

            -- Draw the smear in buffer space instead of screen space when scrolling
            scroll_buffer_space = true,

            -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
            -- Smears will blend better on all backgrounds.
            legacy_computing_symbols_support = false,
        },
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        init = function()
            vim.opt.laststatus = 3
            vim.opt.splitkeep = "screen"
        end,
        opts = {
            bottom = {
                -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
                {
                    ft = "toggleterm",
                    size = { height = 0.2 },
                    -- exclude floating windows
                    filter = function(buf, win)
                        return vim.api.nvim_win_get_config(win).relative == ""
                    end,
                },
                "Trouble",
                { ft = "qf",            title = "QuickFix" },
                {
                    ft = "help",
                    size = { height = 20 },
                    -- only show help buffers
                    filter = function(buf)
                        return vim.bo[buf].buftype == "help"
                    end,
                },
                { ft = "spectre_panel", size = { height = 0.4 } },
            },
            left = {
                -- Neo-tree filesystem always takes half the screen height
                {
                    title = "Neo-Tree",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "filesystem"
                    end,
                    size = { height = 0.5 },
                },
                {
                    title = "Neo-Tree Git",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "git_status"
                    end,
                    pinned = true,
                    collapsed = true, -- show window as closed/collapsed on start
                    open = "Neotree position=right git_status",
                },
                {
                    title = "Neo-Tree Buffers",
                    ft = "neo-tree",
                    filter = function(buf)
                        return vim.b[buf].neo_tree_source == "buffers"
                    end,
                    pinned = true,
                    collapsed = true, -- show window as closed/collapsed on start
                    open = "Neotree position=top buffers",
                },
                -- any other neo-tree windows
                "neo-tree",
            },
        },
    },
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            animate = { enabled = true },
            bigfile = { enabled = true },
            dashboard = {
                enabled = true,
                preset = {
                    header = [[
          _____                    _____                   _______                   _____                    _____                    _____
         /\    \                  /\    \                 /::\    \                 /\    \                  /\    \                  /\    \
        /::\____\                /::\    \               /::::\    \               /::\____\                /::\    \                /::\____\
       /::::|   |               /::::\    \             /::::::\    \             /:::/    /                \:::\    \              /::::|   |
      /:::::|   |              /::::::\    \           /::::::::\    \           /:::/    /                  \:::\    \            /:::::|   |
     /::::::|   |             /:::/\:::\    \         /:::/~~\:::\    \         /:::/    /                    \:::\    \          /::::::|   |
    /:::/|::|   |            /:::/__\:::\    \       /:::/    \:::\    \       /:::/____/                      \:::\    \        /:::/|::|   |
   /:::/ |::|   |           /::::\   \:::\    \     /:::/    / \:::\    \      |::|    |                       /::::\    \      /:::/ |::|   |
  /:::/  |::|   | _____    /::::::\   \:::\    \   /:::/____/   \:::\____\     |::|    |     _____    ____    /::::::\    \    /:::/  |::|___|______
 /:::/   |::|   |/\    \  /:::/\:::\   \:::\    \ |:::|    |     |:::|    |    |::|    |    /\    \  /\   \  /:::/\:::\    \  /:::/   |::::::::\    \
/:: /    |::|   /::\____\/:::/__\:::\   \:::\____\|:::|____|     |:::|    |    |::|    |   /::\____\/::\   \/:::/  \:::\____\/:::/    |:::::::::\____\
\::/    /|::|  /:::/    /\:::\   \:::\   \::/    / \:::\    \   /:::/    /     |::|    |  /:::/    /\:::\  /:::/    \::/    /\::/    / ~~~~~/:::/    /
 \/____/ |::| /:::/    /  \:::\   \:::\   \/____/   \:::\    \ /:::/    /      |::|    | /:::/    /  \:::\/:::/    / \/____/  \/____/      /:::/    /
         |::|/:::/    /    \:::\   \:::\    \        \:::\    /:::/    /       |::|____|/:::/    /    \::::::/    /                       /:::/    /
         |::::::/    /      \:::\   \:::\____\        \:::\__/:::/    /        |:::::::::::/    /      \::::/____/                       /:::/    /
         |:::::/    /        \:::\   \::/    /         \::::::::/    /         \::::::::::/____/        \:::\    \                      /:::/    /
         |::::/    /          \:::\   \/____/           \::::::/    /           ~~~~~~~~~~               \:::\    \                    /:::/    /
         /:::/    /            \:::\    \                \::::/    /                                      \:::\    \                  /:::/    /
        /:::/    /              \:::\____\                \::/____/                                        \:::\____\                /:::/    /
        \::/    /                \::/    /                 ~~                                               \::/    /                \::/    /
         \/____/                  \/____/                                                                    \/____/                  \/____/



        ]],
                },
            },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            quickfile = { enabled = true },
            statuscolumn = { enabled = true },
            scroll = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            words = { enabled = true },
            zen = { enabled = true },
            styles = {
                notification = {
                    wo = { wrap = true } -- Wrap notifications
                },
            },
        },
        keys = {
            { "<leader>.",  function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer" },
            { "<leader>S",  function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer" },
            { "<leader>n",  function() Snacks.notifier.show_history() end,   desc = "Notification History" },
            { "<leader>bd", function() Snacks.bufdelete() end,               desc = "Delete Buffer" },
            { "<leader>cR", function() Snacks.rename.rename_file() end,      desc = "Rename File" },
            { "<leader>gB", function() Snacks.gitbrowse() end,               desc = "Git Browse" },
            { "<leader>gb", function() Snacks.git.blame_line() end,          desc = "Git Blame Line" },
            { "<leader>gf", function() Snacks.lazygit.log_file() end,        desc = "Lazygit Current File History" },
            { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit" },
            { "<leader>gl", function() Snacks.lazygit.log() end,             desc = "Lazygit Log (cwd)" },
            { "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications" },
            { "<c-/>",      function() Snacks.terminal() end,                desc = "Toggle Terminal" },
            { "<c-_>",      function() Snacks.terminal() end,                desc = "which_key_ignore" },
            { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",              mode = { "n", "t" } },
            { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",              mode = { "n", "t" } },
            { "<leader>z",  function() Snacks.zen() end,                     desc = "Zen Mode" },
            { "<leader>Z",  function() Snacks.zen.zoom() end,                desc = "Toggle Zoom" },
            {
                "<leader>N",
                desc = "Neovim News",
                function()
                    Snacks.win({
                        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                        width = 0.6,
                        height = 0.6,
                        wo = {
                            spell = false,
                            wrap = false,
                            signcolumn = "yes",
                            statuscolumn = " ",
                            conceallevel = 3,
                        },
                    })
                end,
            }
        },
        init = function()
            vim.api.nvim_create_autocmd("User", {
                pattern = "VeryLazy",
                callback = function()
                    -- Setup some globals for debugging (lazy-loaded)
                    _G.dd = function(...)
                        Snacks.debug.inspect(...)
                    end
                    _G.bt = function()
                        Snacks.debug.backtrace()
                    end
                    vim.print = _G.dd -- Override print to use snacks for `:=` command

                    -- Create some toggle mappings
                    Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                    Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                    Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                    Snacks.toggle.diagnostics():map("<leader>ud")
                    Snacks.toggle.line_number():map("<leader>ul")
                    Snacks.toggle.option("conceallevel",
                        { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
                    Snacks.toggle.treesitter():map("<leader>uT")
                    Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map(
                        "<leader>ub")
                    Snacks.toggle.inlay_hints():map("<leader>uh")
                    Snacks.toggle.dim():map("<leader>uD")
                    Snacks.toggle.indent():map("<leader>ug")
                end,
            })
        end,
    }
}
