local global = require("global")
local maps = { i = {}, n = {}, v = {}, t = {} }

maps.n["<leader>g"] = { global.empty, desc = "other" }
maps.n["<leader>b"] = { global.empty, desc = "buffer" }
maps.n["<leader>f"] = { global.empty, desc = "find" }
maps.n["<leader>l"] = { global.empty, desc = "lsp" }

maps.n["<leader>s"] = { "<cmd>w<cr>", desc = "save buffer" }
maps.n["<leader>q"] = { "<cmd>q<cr>", desc = "quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "vertical split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "horizontal split" }

maps.i["jj"] = { "<Esc>", desc = "back normal" }

for mode, opts in pairs(maps) do
  global.set_mappings(mode, opts)
end
