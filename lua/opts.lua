vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣", eol = "⤵" }

vim.opt.hlsearch = true
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<cr>")

vim.opt.inccommand = "split"

vim.opt.scrolloff = 7

vim.wo.number = true

vim.opt.cpoptions:append("i")
vim.o.expandtab = true

vim.o.tabstop = 4

vim.o.shiftwidth = 4

vim.o.breakindent = true

vim.o.undofile = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.wo.signcolumn = "yes"
vim.wo.relativenumber = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menu,preview,noselect"

vim.o.termguicolors = true

vim.o.cursorline = true

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0

vim.o.clipboard = "unnamedplus"
vim.g.clipboard = "osc52"

-- [[ disable auto comment on enter ]]
-- see :help formatoptions
vim.api.nvim_create_autocmd("filetype", {
    desc = "remove formatoptions",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})
