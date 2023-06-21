local global = require("global")

local terminal_env = {
  https_proxy = "http://127.0.0.1:7890",
  http_proxy = "http://127.0.0.1:7890",
  all_proxy = "socks5://127.0.0.1:7890",
}

global.set_mappings("n", {
  ["<leader>tt"] = {
    function()
      local terminal = require("toggleterm.terminal")
      terminal.Terminal
          :new({
            env = terminal_env,
            direction = "float"
          })
          :toggle()
    end,
    desc = "open float terminal",
  },
  ["<leader>th"] = {
    function()
      local terminal = require("toggleterm.terminal")
      terminal.Terminal
          :new({
            env = terminal_env,
            direction = "horizontal"
          })
          :toggle()
    end,
    desc = "open horizontal split terminal",
  },
  ["<leader>tv"] = {
    function()
      local terminal = require("toggleterm.terminal")
      terminal.Terminal
          :new({
            env = terminal_env,
            direction = "vertical"
          })
          :toggle()
    end,
    desc = "open vertical split terminal",
  },
  ["<leader>gg"] = {
    function()
      local terminal = require("toggleterm.terminal")
      terminal.Terminal:new({
        cmd = "lazygit",
        env = terminal_env,
        direction = "float"
      }):toggle()
    end,
    desc = "open lazygit",
  },
})

return { "akinsho/toggleterm.nvim" }
