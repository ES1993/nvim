local global = require("global")

return {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
        global.set_mappings("n", {
            ["<leader>/"] = {
                function()
                    require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
                end,
                desc = "toggle comment line",
            }
        })

        global.set_mappings("v", {
            ["<leader>/"] = {
                "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
                desc = "toggle comment for selection",
            }
        })

        require('Comment').setup {
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end
}
