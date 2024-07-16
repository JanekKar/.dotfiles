vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab=true
vim.opt.smartindent=true

vim.opt.exrc=true
vim.opt.nu=true
vim.opt.relativenumber = true

vim.opt.hlsearch=false
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.hidden=true
vim.opt.wrap=false

vim.opt.backup=false
vim.opt.swapfile=false
vim.opt.undodir=os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile=true

vim.opt.termguicolors=true
vim.opt.scrolloff=8
vim.opt.colorcolumn="120"
vim.opt.signcolumn="yes"

vim.opt.cmdheight=1

vim.opt.fileencoding="utf-8"

vim.opt.mouse="a"

-- Open splits to right
vim.opt.splitright=true

vim.g.mapleader = " "
