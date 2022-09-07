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
