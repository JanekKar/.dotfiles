require("janekkar.set")
require("janekkar.packer")
require("janekkar.neogit")
require("janekkar.remap")

local augroup = vim.api.nvim_create_augroup
janekkarGroup = augroup('JanekKar', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})


autocmd({"BufWritePre"}, {
    group = janekkarGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})



autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 50,
        })
    end,
})


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
