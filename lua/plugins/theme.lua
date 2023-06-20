local global = require("global");

global.set_mappings("n", {
  ["<leader>b1"] = { function() require("bufdelete").go_to(1) end, desc = "buffer 1" },
  ["<leader>b2"] = { function() require("bufdelete").go_to(2) end, desc = "buffer 2" },
  ["<leader>b3"] = { function() require("bufdelete").go_to(3) end, desc = "buffer 3" },
  ["<leader>bh"] = { function() require("bufdelete").cycle(-1) end, desc = "prev" },
  ["<leader>bl"] = { function() require("bufdelete").cycle(1) end, desc = "next" },
  ["<leader>bc"] = { function() require("bufdelete").bufdelete(0, true) end, desc = "close" },
})

return {
  { 'nvim-tree/nvim-web-devicons' },
  { "famiu/bufdelete.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "moon",
      })
      global.set_theme("tokyonight")

      require('lualine')
      require("bufferline")
      require("which-key")
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup({
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          sections = { lualine_c = { "os.date('%a')", 'data', "require'lsp-status'.status()" } }
        }
      })
    end
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require("bufferline").setup()
    end
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  },
}
