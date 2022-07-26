local neogit = require('neogit')
local nnoremap = require("janekkar.keymap").nnoremap

neogit.setup{}

nnoremap("<leader>gs", function()
  neogit.open({})
end);
