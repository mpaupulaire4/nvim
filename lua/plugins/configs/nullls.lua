local builtins = require("null-ls").builtins

require("null-ls").setup({
    sources = {
        builtins.diagnostics.eslint_d,
        builtins.diagnostics.rubocop,
        builtins.diagnostics.stylelint,
        builtins.code_actions.eslint_d,
        builtins.formatting.prettierd,
    },
})
