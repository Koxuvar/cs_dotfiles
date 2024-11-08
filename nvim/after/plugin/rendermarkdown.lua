local md = require('render-markdown')

md.setup({
    preset = 'none',
    injections = {
        gitcommit = {
            enabled = true,
            query = [[
                ((message) @injection.content
                    (#set! injection.combined)
                    (#set! injection.include-children)
                    (#set! injection.language "markdown"))
            ]],
        },
    },
})


vim.keymap.set('n', '<leader>md', function() 
    vim.cmd.RenderMarkdown 'toggle'
end)
