local Remap = require("custom.keymap")
local nnoremap = Remap.nnoremap


-- Telescope remaps
nnoremap("<leader>ff", ":lua require('telescope.builtin').find_files()<CR>")
nnoremap("<leader>fo", ":lua require('telescope.builtin').oldfiles()<CR>")
nnoremap("<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
nnoremap("<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<leader>ps", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input(\"Grep Form > \")})<CR>")

require('telescope').setup{
defaults ={
  file_ignore_patterns = {
        "target",
        "__init__.py",
    }
  }
}
