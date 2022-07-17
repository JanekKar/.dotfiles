set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

"Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Adding plugins
call plug#begin("~/.vim/plugged")
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'navarasu/onedark.nvim'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

  " Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim'

  " Better git tools
  Plug 'airblade/vim-gitgutter'

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " Auto closing brackets etc.
  Plug 'jiangmiao/auto-pairs'

  Plug 'ambv/black'

  " Scala LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'scalameta/nvim-metals'
  " Plug 'nvim-lua/completion-nvim'

  " cmp settings
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'onsails/lspkind.nvim'

  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-surround'

  Plug 'TimUntersberger/neogit'
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | source $MYVIMRC
\| endif

" Remove trailing spaces
augroup MY_GROUP
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END

" Spellchecking
"set spell spelllang=en,pl
"set spellsuggest=best,9

" Remaps
let mapleader=" "


augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=200})
augroup END

" Completion setup
" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" Disable arrow keys and page up / down
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
noremap <PageUp> <nop>
inoremap <PageUp> <nop>
vnoremap <PageUp> <nop>
noremap <PageDown> <nop>
inoremap <PageDown> <nop>
