local global = require("global");

global.set_mappings("n", {
  ["<leader>t"] = { global.empty, desc = "terminal" },
  ["<leader>tt"] = {
    function()
      local terminal = require("toggleterm.terminal")
      terminal.Terminal:new({
        env = {
          https_proxy = "http://127.0.0.1:7890",
          http_proxy = "http://127.0.0.1:7890",
          all_proxy = "socks5://127.0.0.1:7890",
        }
      }):toggle()
    end,
    desc = "open terminal"
  },
  ["<leader>tg"] = {
    function()
      local terminal = require("toggleterm.terminal")
      terminal.Terminal:new({ cmd = "lazygit" }):toggle()
    end,
    desc = "open lazygit"
  }
})

return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = 10,
    on_create = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    open_mapping = [[<F7>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
      border = "curved",
      highlights = { border = "Normal", background = "Normal" },
    },
  }
}
