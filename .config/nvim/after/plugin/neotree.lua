local ntree = require("neo-tree")
local ntreeExec = require("neo-tree.command")

vim.keymap.set("n", "<leader>bf", function() ntreeExec.execute({ toggle = "true", source = "filesystem" }) end)
vim.keymap.set("n", "<leader>bb", function() ntreeExec.execute({ toggle = "true", source = "buffers" }) end)

local function getTelescopeOpts(state, path)
    return {
        cwd = path,
        search_dirs = { path },
        attach_mappings = function(prompt_bufnr, map)
            local actions = require "telescope.actions"
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local action_state = require "telescope.actions.state"
                local selection = action_state.get_selected_entry()
                local filename = selection.filename
                if (filename == nil) then
                    filename = selection[1]
                end
                -- any way to open the file without triggering auto-close event of neo-tree?
                require("neo-tree.sources.filesystem").navigate(state, state.path, filename)
            end)
            return true
        end
    }
end


ntree.setup({
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            always_show = {
                ".config",
            },
        },
        window = {
            mappings = {
                ["tf"] = "telescope_find",
                ["tg"] = "telescope_grep",
            },
        },
        components = {
            harpoon_index = function(config, node, _)
                local Marked = require("harpoon.mark")
                local path = node:get_id()
                local success, index = pcall(Marked.get_index_of, path)
                if success and index and index > 0 then
                    return {
                        text = string.format("- %d ", index), -- <-- Add your favorite harpoon like arrow here
                        highlight = config.highlight or "NeoTreeDirectoryIcon",
                    }
                else
                    return {
                        text = "  ",
                    }
                end
            end,
        },
        renderers = {
            file = {
                { "icon" },
                { "name",         use_git_status_colors = true },
                { "harpoon_index" }, --> This is what actually adds the component in where you want it
                { "diagnostics" },
                { "git_status",   highlight = "NeoTreeDimText" },
            },
        },
    },
    commands = {
        telescope_find = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").find_files(getTelescopeOpts(state, path))
        end,
        telescope_grep = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require("telescope.builtin").live_grep(getTelescopeOpts(state, path))
        end,
    },
})
