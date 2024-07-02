  return{
    'navarasu/onedark.nvim',
    config = function()
        vim.opt.laststatus=2
        vim.opt.showmode=false

        vim.opt.syntax="off"

        require('onedark').setup {
            style = 'dark'
        }
        require('onedark').load()

      end
  }

