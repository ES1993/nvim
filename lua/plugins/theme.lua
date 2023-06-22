local global = require("global")

global.set_mappings("n", {
  ["<leader>b1"] = {
    function()
      require("bufferline").go_to(1)
    end,
    desc = "buffer 1",
  },
  ["<leader>b2"] = {
    function()
      require("bufferline").go_to(2)
    end,
    desc = "buffer 2",
  },
  ["<leader>b3"] = {
    function()
      require("bufferline").go_to(3)
    end,
    desc = "buffer 3",
  },
  ["<leader>bh"] = {
    function()
      require("bufferline").cycle(-1)
    end,
    desc = "prev",
  },
  ["<leader>bl"] = {
    function()
      require("bufferline").cycle(1)
    end,
    desc = "next",
  },
  ["<leader>bc"] = {
    function()
      require("bufdelete").bufdelete(0, true)
    end,
    desc = "close",
  },
  ["<leader>o"] = { "<cmd>NvimTreeFocus<cr>", desc = "focus tree" },
})

return {
  { "nvim-tree/nvim-web-devicons" },
  { "famiu/bufdelete.nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({})
    end,
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
      require("lualine")
      require("bufferline")
      require("which-key")
    end,
  },
  { "linrongbin16/lsp-progress.nvim" },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local function date()
        return os.date("%m-%d %H:%M")
      end

      require("lsp-progress").setup({
        format = function(messages)
          local sign = " LSP"

          if #messages > 0 then
            return sign .. " " .. table.concat(messages, " ")
          end

          local client_names = {}
          local active_clients = vim.lsp.get_active_clients()

          if #active_clients > 0 then
            local cur_filetype = vim.api.nvim_buf_get_option(0, "filetype")
            for _, client in ipairs(active_clients) do
              local filetypes = client.config.filetypes
              local client_name = client.name
              local has_filetype = vim.fn.index(filetypes, cur_filetype) ~= -1
              if filetypes and has_filetype and client_name ~= "" then
                table.insert(client_names, "[" .. client_name .. "]")
              end
            end
          end

          if #client_names > 0 then
            return sign .. " " .. table.concat(client_names, " ")
          end

          return ""
        end,
      })

      require("lualine").setup({
        options = {
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_c = { "encoding", "filename", "filesize" },
          lualine_x = { require("lsp-progress").progress },
          lualine_y = { "progress", "location" },
          lualine_z = { date },
        },
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  },
}
