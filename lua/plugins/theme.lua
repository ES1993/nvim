local global = require("global");

global.set_mappings("n", {
  ["<leader>b1"] = { function() require("bufferline").go_to(1) end, desc = "buffer 1" },
  ["<leader>b2"] = { function() require("bufferline").go_to(2) end, desc = "buffer 2" },
  ["<leader>b3"] = { function() require("bufferline").go_to(3) end, desc = "buffer 3" },
  ["<leader>bh"] = { function() require("bufferline").cycle(-1) end, desc = "prev" },
  ["<leader>bl"] = { function() require("bufferline").cycle(1) end, desc = "next" },
  ["<leader>bc"] = { function() require("bufdelete").bufdelete(0, true) end, desc = "close" },
  ["<leader>o"] = { "<cmd>NvimTreeFocus<cr>", desc = "focus tree" }
})

return {
  { 'nvim-tree/nvim-web-devicons' },
  { "famiu/bufdelete.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({})
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({
        style = "moon",
      })
      global.set_theme("tokyonight")

      require("nvim-tree")
      require('lualine')
      require("bufferline")
      require("which-key")
    end
  },
  { 'linrongbin16/lsp-progress.nvim' },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function date()
        return os.date("%m-%d %H:%M")
      end

      require('lsp-progress').setup({
        format = function(client_messages)
          local sign = " LSP"

          if #client_messages > 0 then
            return sign .. " " .. table.concat(client_messages, " ")
          else
            local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
            local clients = vim.lsp.get_active_clients()

            if next(clients) == nil then
              return sign
            end

            for _, client in ipairs(clients) do
              local filetypes = client.config.filetypes

              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return sign .. "[" .. client.name .. "]"
              end
            end
          end

          return sign
        end,
      })

      require('lualine').setup({
        options = {
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_c = { "encoding", "filename", "filesize" },
          lualine_x = { require('lsp-progress').progress },
          lualine_y = { "progress", "location" },
          lualine_z = { date }
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
