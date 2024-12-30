return {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = {
                "nvim-lua/plenary.nvim",
                {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
            },
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            config = function() require("telescope").load_extension "frecency" end,
        }
