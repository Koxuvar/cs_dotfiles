require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls" },
}

-- Reserve a space in the gutter
vim.opt.signcolumn = "yes"

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)


local builtin = require("telescope.builtin")

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        -- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
        vim.keymap.set("n", "go", builtin.lsp_type_definitions, opts)
        vim.keymap.set("n", "gr", builtin.lsp_references, opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        -- vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end,
})

local toggle_lsp_client = function()
    local buf = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients({ bufnr = buf })
    if not vim.tbl_isempty(clients) then
        vim.cmd("LspStop")
    else
        vim.cmd("LspStart")
    end
end


vim.keymap.set("n", "<leader>ls", toggle_lsp_client)

-- You"ll find a list of language servers here:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
-- These are example language servers.
-- vim.lsp.config('rust_analyzer', {
--     on_attach = function(_, bufnr)
--         vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
--     end
-- })
vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "W391" },
                    maxLineLength = 100
                }
            }
        }
    }
})
vim.lsp.config('emmet_language_server', {
    filetypes = { "typescriptreact", "javascriptreact", "html", "css" },
    init_options = {
        showExpandedAbbreviation = "always",
        showAbbreviationSuggestions = false,
    },
})
vim.lsp.config('eslint', {})
vim.lsp.config('ts_ls', {
    single_file_support = false,
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            },
        },
    },
    on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})
vim.lsp.config('clangd', {
    init_options = {
        fallbackFlags = { "--std=c++20" }
    },
})
vim.lsp.config('bashls', {})
vim.lsp.config('json_ls', {})
vim.lsp.config('zls', {
    on_attach = {
        vim.lsp.inlay_hint.enable(true)
    },
    settings = {
        zls = {
            inlay_hints_show_variable_type_hints = true,
            inlay_hints_hide_redundant_param_names = true,
            inlay_hints_show_struct_literal_field_types = true,
            enable_build_on_save = true,
        }
    }
})
vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            runtime = {
                -- Tell the language server which version of Lua you"re using
                -- (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT"
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME
                    -- Depending on the usage, you might want to add additional paths here.
                    -- "${3rd}/luv/library"
                    -- "${3rd}/busted/library",
                }
                -- or pull in all of "runtimepath". NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                -- library = vim.api.nvim_get_runtime_file("", true)
            }
        })
    end,
    settings = {
        Lua = {}
    }
})


local cmp = require("cmp")
local cmp_autopairs = require('nvim-autopairs.completion.cmp');

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "supermaven" },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = "select" }),

        -- `Enter` key to confirm completion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Scroll up and down in the completion documentation
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require("luasnip").locally_jumpable(1) then
                require("luasnip").jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require("luasnip").locally_jumpable(-1) then
                require("luasnip").jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
})
