return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")
        local cmp_autopairs = require('nvim-autopairs.completion.cmp');

        require('cmp').event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

        npairs.setup({})

        npairs.add_rules({
            Rule("|", "|", "rust")
                :with_pair(cond.not_inside_quote()),
        })
    end,
}
