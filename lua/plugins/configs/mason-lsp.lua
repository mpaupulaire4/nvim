require("mason-lspconfig").setup {
  ensure_installed = {
    "cssls",
    "html",
    "tsserver",
    "sumneko_lua",
    "rust_analyzer",
    "svelte",
  },
  automatic_installation = true,
}

