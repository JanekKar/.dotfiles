local neogit = require('neogit')
local Remap = require("custom.keymap")
local nnoremap = Remap.nnoremap

neogit.setup{}

nnoremap("<leader>gs", function()
  neogit.open({})
end);
