-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'navarasu/onedark.nvim'
  use {'akinsho/bufferline.nvim',  tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons'}

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'

  -- Better git tools
  use 'airblade/vim-gitgutter'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  -- Auto closing brackets etc.
  -- use 'jiangmiao/auto-pairs'

  use 'ambv/black'

  -- Scala LSP
  use 'neovim/nvim-lspconfig'
  use 'scalameta/nvim-metals'
  -- use 'nvim-lua/completion-nvim'

  -- cmp settings
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'onsails/lspkind.nvim'

  -- Comments
  use 'preservim/nerdcommenter'
  use 'tpope/vim-surround'

  use 'TimUntersberger/neogit'

  use 'mbbill/undotree'
end)
