local builtins = require("null-ls").builtins

require("null-ls").setup({
    sources = {
        builtins.diagnostics.eslint_d.with({
            extra_filetypes = { "svelte" },
        }),
        builtins.code_actions.eslint_d.with({
            extra_filetypes = { "svelte" },
        }),
        builtins.formatting.prettierd,
    },
})
