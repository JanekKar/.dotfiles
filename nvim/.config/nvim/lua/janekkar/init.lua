require("janekkar.set")
require("janekkar.remap")
require("janekkar.lazy_init")

local augroup = vim.api.nvim_create_augroup
janekkarGroup = augroup('JanekKar', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- function R(name)
    -- require("plenary.reload").reload_module(name)
-- end

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

autocmd('LspAttach', {
    group = janekkarGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>nd", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.goto_prev() end, opts)

        vim.keymap.set("n", "gws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
