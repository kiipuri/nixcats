local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        nix = { "nixfmt" },
        typescriptreact = { "prettierd", stop_after_first = true },
    },
    formatters = {
        stylua = {
            args = {
                "--indent-type",
                "Spaces",
                "--stdin-filepath",
                "$FILENAME",
                "-",
            },
        },
    },
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 3000,
        })
    end,
})
