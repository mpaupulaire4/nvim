return {
  {
    "williamboman/mason.nvim",
    lazy = true,
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
    "williamboman/mason-lspconfig.nvim",
    event = "BufRead",
    dependencies = {
      "simrat39/rust-tools.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "j-hui/fidget.nvim",
      "b0o/schemastore.nvim",
      'sigmasd/deno-nvim',
    },
    keys = {
      -- { "H",          vim.lsp.buf.hover },
      { "L",         vim.lsp.buf.signature_help },
      -- { "<leader>gt", vim.lsp.buf.type_definition },
      -- { "<leader>r",  vim.lsp.buf.rename },
      -- { "<leader>a",  vim.lsp.buf.code_action },
      -- { "<leader>dd", vim.diagnostic.open_float },
      -- { "<leader>dp", vim.diagnostic.goto_prev },
      -- { "<leader>dn", vim.diagnostic.goto_next },
      { "<leader>p", vim.lsp.buf.format },
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "cssls",
          "html",
          "tsserver",
          "lua_ls",
        },
        automatic_installation = false,
      }

      vim.diagnostic.config {
        virtual_text = {
          prefix = "",
        },
        signs = false,
        underline = true,
        update_in_insert = true,
      }

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require "lspconfig"
      local navic = require("nvim-navic")

      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      require("mason-lspconfig").setup_handlers {
        function(server_name) -- default handler (optional)
          lspconfig[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
          }
        end,
        ["denols"] = function()
          require("deno-nvim").setup {
            server = {
              capabilities = capabilities,
              on_attach = on_attach,
              root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
            }
          }
        end,
        ["jsonls"] = function()
          lspconfig["jsonls"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              json = {
                schemas = require('schemastore').json.schemas(),
                validate = { enable = true }
              }
            }
          }
        end,
        ["tsserver"] = function()
          lspconfig["tsserver"].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            root_dir = lspconfig.util.root_pattern("package.json", "jsconfig.jsonc")
          }
        end,
        ["rust_analyzer"] = function()
          require("rust-tools").setup {
            server = {
              standalone = false,
              capabilities = capabilities,
              on_attach = on_attach,
            },
          }
        end
      }
    end,
  },
  {
    'jayp0521/mason-null-ls.nvim',
    event = "BufRead",
    opts = {
      ensure_installed = {},
      automatic_installation = true,
      automatic_setup = true,
    }
  },
}
