return {
  {
    "mason-org/mason.nvim",
    config = true,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "jdtls",
        "clangd",
      },
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP-Configs setzen
      vim.lsp.config.lua_ls = { capabilities = capabilities }
      vim.lsp.config.rust_analyzer = {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = {
            diagnostics = {
              enable = true,
              disabled = {}, -- no disabled warnings
            },
            checkOnSave = true,
          }
        },
      }
      vim.lsp.config.jdtls = { capabilities = capabilities }
      vim.lsp.config.clangd = { capabilities = capabilities }

      -- Server starten
      vim.lsp.enable({ "lua_ls", "rust_analyzer", "jdtls", "clangd" })

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end
  },
}
