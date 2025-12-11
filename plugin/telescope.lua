require("telescope").setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
        },
    },
})

pcall(require("telescope").load_extension, "ui-select")
pcall(require("telescope").load_extension, "ui-fzf")
