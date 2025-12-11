local function map(mode, keys, callback, desc)
    vim.keymap.set(mode, keys, callback, { desc = desc })
end

vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>lh", function()
    require("noice.lsp").hover()
end, { desc = "Hover" })
vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>h", "<cmd>noh<cr><cmd>NoiceDismiss<cr>", { desc = "Dismiss messages and highlights" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>ls", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>li", function()
    require("telescope.builtin").lsp_implementations()
end, { desc = "Go to implementation" })

vim.keymap.set("n", "<leader>lR", function()
    require("telescope.builtin").lsp_references()
end, { desc = "Show references" })

vim.keymap.set("n", "<leader>le", function()
    require("telescope.builtin").diagnostics()
end, { desc = "Show diagnostics" })

vim.keymap.set("v", "<s-j>", ":m '>+1<cr>gv=gv", { desc = "moves line down" })
vim.keymap.set("v", "<s-k>", ":m '<-2<cr>gv=gv", { desc = "moves line up" })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "scroll down" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "scroll up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "next search result" })
vim.keymap.set("n", "n", "nzzzv", { desc = "previous search result" })

vim.keymap.set("n", "<c-j>", "<c-w>j", { desc = "Move down a buffer" })
vim.keymap.set("n", "<c-k>", "<c-w>k", { desc = "Move up a buffer" })
vim.keymap.set("n", "<c-h>", "<c-w>h", { desc = "Move left a buffer" })
vim.keymap.set("n", "<c-l>", "<c-w>l", { desc = "Move right a buffer" })
vim.keymap.set("n", "<leader>n", "<cmd>Yazi<cr>", { desc = "Open yazi" })
vim.keymap.set({ "n", "v", "x" }, "<leader><c-a>", "gg0vG$", { noremap = true, silent = true, desc = "select all" })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup("yankhighlight", { clear = true })
vim.api.nvim_create_autocmd("textyankpost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = "*",
})

vim.keymap.set(
    "x",
    "p",
    '"_dP',
    { noremap = true, silent = true, desc = "Paste over selection without erasing unnamed register" }
)

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.HINT] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.WARN] = "",
        },
    },
})

map("n", "<leader>sg", function()
    return require("telescope.builtin").live_grep()
end, "[S]each by [G]rep")

local harpoon = require("harpoon")
harpoon:setup()

map("n", "<leader>jf", function()
    harpoon:list():select(1)
end, "Harpoon select file 1")

map("n", "<leader>jd", function()
    harpoon:list():select(2)
end, "Harpoon select file 2")

map("n", "<leader>js", function()
    harpoon:list():select(3)
end, "Harpoon select file 3")

map("n", "<leader>ja", function()
    harpoon:list():select(4)
end, "Harpoon select file 4")

map("n", "<leader>jm", function()
    harpoon:list():add()
end, "Harpoon add file")

map("n", "<leader>jt", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, "Harpoon toggle quick menu")
