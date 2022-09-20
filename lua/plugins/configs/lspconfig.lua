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

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
--   border = "single",
-- })
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
--   border = "single",
-- })

-- local function on_attach(_, _)
--    -- local function buf_set_option(...)
--    --    vim.api.nvim_buf_set_option(bufnr, ...)
--    -- end
--    --
--    -- -- Enable completion triggered by <c-x><c-o>
--    -- buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
--    require("core.mappings").lspconfig()
-- end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require "lspconfig"

lspconfig["cssls"].setup {
  capabilities = capabilities
}

lspconfig["jsonls"].setup {
  capabilities = capabilities
}

lspconfig["html"].setup {
  capabilities = capabilities
}

lspconfig["tsserver"].setup {
  capabilities = capabilities
}

lspconfig["sumneko_lua"].setup {
  capabilities = capabilities
}

lspconfig["svelte"].setup {
  capabilities = capabilities
}

require("rust-tools").setup({
  server = {
    standalone = false,
    capabilities = capabilities,
  },
})
local map = require('core.utils').map
-- See `:help vim.lsp.*` for documentation on any of the below functions
-- map("n", m.declaration,  vim.lsp.buf.declaration)
-- map("n", m.definition,  vim.lsp.buf.definition)
map("n", "H", vim.lsp.buf.hover)
-- map("n", m.implementation,  vim.lsp.buf.implementation)
map("n", "L", vim.lsp.buf.signature_help)
-- map("n", m.add_workspace_folder,  vim.lsp.buf.add_workspace_folder)
-- map("n", m.remove_workspace_folder,  vim.lsp.buf.remove_workspace_folder)
-- map("n", m.list_workspace_folders,  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
-- map("n", m.type_definition,  vim.lsp.buf.type_definition)
map("n", "<leader>r", vim.lsp.buf.rename)
map("n", "<leader>a", vim.lsp.buf.code_action)
-- map("n", m.references,  vim.lsp.buf.references)
map("n", "<leader>dd", vim.diagnostic.open_float)
map("n", "<leader>dp", vim.diagnostic.goto_prev)
map("n", "<leader>dn", vim.diagnostic.goto_next)
-- map("n", m.set_loclist,  vim.diagnostic.setloclist)
map("n", "<leader>p", vim.lsp.buf.formatting_sync)
