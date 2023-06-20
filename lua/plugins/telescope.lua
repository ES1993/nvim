local global = require("global");

global.set_mappings("n", {
    ["<leader>ff"] = {
        function() require("telescope.builtin").find_files() end,
        desc = "find files"
    },
    ["<leader>fb"] = {
        function() require("telescope.builtin").buffers() end,
        desc = "find buffers"
    },
    ["<leader>fw"] = {
        function() require("telescope.builtin").live_grep() end,
        desc = "find words"
    },
    ["<leader>fp"] = {
        "<cmd>Telescope project<cr>",
        desc = "find project"
    },
    ["<leader>gt"] = {
        "<cmd>Telescope file_browser<cr>",
        desc = "dir tree"
    },
    ["<leader>fs"] = {
        "<cmd>Telescope aerial<cr>",
        desc = "find symbols"
    },
    ["<leader>ls"] = {
        function() require("aerial").toggle() end,
        desc = "symbols outline"
    },
})

return {
    { 'nvim-lua/plenary.nvim' },
    { "nvim-telescope/telescope-project.nvim" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
        "stevearc/aerial.nvim",
        opts = {
            attach_mode = "global",
            backends = { "lsp", "treesitter", "markdown", "man" },
            layout = { min_width = 28 },
            show_guides = true,
            filter_kind = false,
            guides = {
                mid_item = "├ ",
                last_item = "└ ",
                nested_top = "│ ",
                whitespace = "  ",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local project_actions = require("telescope._extensions.project.actions")

            telescope.load_extension('aerial')
            telescope.load_extension("file_browser")
            telescope.load_extension("project")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-n>"] = actions.cycle_history_next,
                            ["<C-p>"] = actions.cycle_history_prev,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        },
                        n = { q = actions.close },
                    },
                },
                extensions = {
                    file_browser = {
                        git_status = true
                    },
                    project = {
                        base_dirs = {
                            '~',
                        },
                        hidden_files = true,
                        order_by = "asc",
                        search_by = "title",
                        on_project_selected = function(prompt_bufnr)
                            project_actions.change_working_directory(prompt_bufnr, false)
                        end
                    },
                }
            })
        end
    }

}
