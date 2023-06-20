local global = require("global");

global.set_mappings("n", {
    ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "move to left split" },
    ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "move to below split" },
    ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "move to above split" },
    ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "move to right split" },
    ["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "resize split up" },
    ["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "resize split down" },
    ["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "resize split lef" },
    ["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "resize split right" },
})

return {
    {
        "mrjones2014/smart-splits.nvim",
        opts = {
            ignored_filetypes = { "nofile", "quickfix", "qf", "prompt" },
            ignored_buftypes = { "nofile" }
        },
    },
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            local leap = require('leap')

            vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
            vim.api.nvim_set_hl(0, 'LeapMatch', {
                fg = 'white', bold = true, nocombine = true,
            })
            vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
                fg = 'red', bold = true, nocombine = true,
            })
            vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
                fg = 'blue', bold = true, nocombine = true,
            })
            leap.opts.highlight_unlabeled_phase_one_targets = true

            leap.add_default_mappings()
        end
    },
    {
        "ggandor/flit.nvim",
        config = function()
            require("flit").setup {
                keys = { f = 'f', F = 'F', t = 't', T = 'T' },
                labeled_modes = "v",
                multiline = true,
                opts = {}
            }
        end
    }
}
