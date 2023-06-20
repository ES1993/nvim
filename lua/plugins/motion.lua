local global = require("global");

global.set_mappings("n", {
    ["<leader>gs"] = {
        function()
            local focusable_windows_on_tabpage = vim.tbl_filter(
                function(win) return vim.api.nvim_win_get_config(win).focusable end,
                vim.api.nvim_tabpage_list_wins(0)
            )
            require('leap').leap { target_windows = focusable_windows_on_tabpage }
        end,
        desc = "leap all window"
    }
})

return {
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        event = { "BufReadPost", "BufNewFile" },
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
        event = { "BufReadPost", "BufNewFile" },
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
