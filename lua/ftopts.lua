vim.api.nvim_create_autocmd("filetype", {
    desc = "indentations for filetypes",
    pattern = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json", "svelte" },
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
        vim.opt_local.softtabstop = 2
    end,
})
