local global = require("global");

global.set_mappings("n", {
  ["<leader>m"] = {
    "<cmd>Mason<cr>",
    desc = "format"
  },
  ["<leader>gf"] = {
    function() vim.lsp.buf.format() end,
    desc = "format"
  }
})

return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate",
      "MasonUpdateAll",
    },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_uninstalled = "✗",
            package_pending = "⟳",
          },
        },
      })
    end
  },
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason-lspconfig.nvim",
    cmd = {
      "LspInstall",
      "LspUninstall"
    },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup {}
        end,
      })
    end,
  },
  { "jose-elias-alvarez/null-ls.nvim" },
  {
    "jay-babu/mason-null-ls.nvim",
    cmd = {
      "NullLsInstall",
      "NullLsUninstall"
    },
    opts = { handlers = {} },
    lazy = false,
    config = function()
      local null_ls = require('null-ls')
      local sources = require("null-ls.sources")
      local methods = require("null-ls.methods")
    --   print(methods.internal)
    --   for key, value in pairs(sources) do
    --     print(key,value)

    --   end


    --   for _, source in ipairs(sources.get_available(filetype)) do
    --     for method in pairs(source.methods) do
    --       registered[method] = registered[method] or {}
    --       table.insert(registered[method], source.name)
    --     end
    --   end

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        }
      }

      require("mason-null-ls").setup {
        ensure_installed = nil,
        automatic_installation = true,
      }
    end
  },
}
