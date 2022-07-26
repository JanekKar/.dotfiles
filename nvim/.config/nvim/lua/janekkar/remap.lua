local nnoremap = require("janekkar.keymap").nnoremap
local inoremap = require("janekkar.keymap").inoremap
local vnoremap = require("janekkar.keymap").vnoremap

nnoremap("<leader>ee", "<cmd>Ex<Cr>")

nnoremap("<Up>", "<nop>")
nnoremap("<Down>", "<nop>")
nnoremap("<Left>", "<nop>")
nnoremap("<Right>", "<nop>")
inoremap("<Up>", "<nop>")
inoremap("<Down>", "<nop>")
inoremap("<Left>", "<nop>")
inoremap("<Right>", "<nop>")
vnoremap("<Up>", "<nop>")
vnoremap("<Down>", "<nop>")
vnoremap("<Left>", "<nop>")
vnoremap("<Right>", "<nop>")
nnoremap("<PageUp>", "<nop>")
inoremap("<PageUp>", "<nop>")
vnoremap("<PageUp>", "<nop>")
nnoremap("<PageDown>", "<nop>")
inoremap("<PageDown>", "<nop>")

nnoremap("<leader>u", ":UndotreeShow<CR>")
