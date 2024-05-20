vim.g.mapleader = " "
vim.o.nu = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.mouse = "a"

vim.o.backup = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.clipboard = "unnamedplus" -- same as system clipboard

vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30

vim.o.completeopt = "menuone,noselect"

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"

vim.o.updatetime = 50

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.o.termguicolors = true

vim.lsp.inlay_hint.enable(true)
