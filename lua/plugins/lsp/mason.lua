return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ui = {
        icons = {
          package_installed = "",
          package_pending = "",
          package_uninstalled = ""
        },
        border = "rounded"
      }
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = 'VeryLazy',
    dependencies = {
      "simrat39/rust-tools.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
    },
    keys = {
      { "H", vim.lsp.buf.hover },
      -- {m.implementation,  vim.lsp.buf.implementation},
      { "L", vim.lsp.buf.signature_help },
      -- {m.add_workspace_folder,  vim.lsp.buf.add_workspace_folder},
      -- {m.remove_workspace_folder,  vim.lsp.buf.remove_workspace_folder},
      -- {m.list_workspace_folders,  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>"},
      -- {m.type_definition,  vim.lsp.buf.type_definition},
      { "<leader>r", vim.lsp.buf.rename },
      { "<leader>a", vim.lsp.buf.code_action },
      -- {m.references,  vim.lsp.buf.references},
      { "<leader>dd", vim.diagnostic.open_float },
      { "<leader>dp", vim.diagnostic.goto_prev },
      { "<leader>dn", vim.diagnostic.goto_next },
      -- {m.set_loclist,  vim.diagnostic.setloclist},
      { "<leader>p", vim.lsp.buf.format },
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "cssls",
          "html",
          "tsserver",
          "sumneko_lua",
        },
        automatic_installation = false,
      }

      local function lspSymbol(name, icon)
        local hl = "DiagnosticSign" .. name
        vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
      end

      lspSymbol("Error", "")
      lspSymbol("Info", "")
      lspSymbol("Hint", "")
      lspSymbol("Warn", "")

      vim.diagnostic.config {
        virtual_text = {
          prefix = "",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require "lspconfig"

      require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
          lspconfig[server_name].setup {
            capabilities = capabilities
          }
        end,
        ["denols"] = function()
          lspconfig["denols"].setup {
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
          }
        end,
        ["tsserver"] = function()
          lspconfig["tsserver"].setup {
            capabilities = capabilities,
            root_dir = lspconfig.util.root_pattern("package.json", "jsconfig.jsonc")
          }
        end,
        ["rust_analyzer"] = function()
          require("rust-tools").setup {
            server = {
              standalone = false,
              capabilities = capabilities,
            },
          }
        end
      }
    end,
  },
  {
    'jayp0521/mason-null-ls.nvim',
    event = 'VeryLazy',
    opts = {
      ensure_installed = {},
      automatic_installation = true,
      automatic_setup = true,
    }
  },
}
