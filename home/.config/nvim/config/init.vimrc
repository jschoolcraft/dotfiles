" ================ vim-plug Config =====================
" source: https://github.com/junegunn/vim-plug
" :PlugInstall

call plug#begin('~/.config/nvim/plugged')

" editing
Plug 'tpope/vim-surround'
Plug 'junegunn/vim-easy-align'
Plug 'alvan/vim-closetag'
Plug 'editorconfig/editorconfig-vim' " consistency with peers in projects

" git
Plug 'tpope/vim-fugitive'

" csv
Plug 'mechatroner/rainbow_csv'

" finding things
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'

" Syntax Highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/vim-vsnip'

Plug 'onsails/lspkind-nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" rails
Plug 'tpope/vim-rails'

" react / react-native / javascript
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" syntax
Plug 'sheerun/vim-polyglot'

" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'jsahlen/vim-ir_black'
Plug 'rakr/vim-one'
Plug 'sainnhe/sonokai'

" status bar
Plug 'itchyny/lightline.vim' "airline replacements'

" wiki/notes/misc
Plug 'vimwiki/vimwiki'
Plug 'plasticboy/vim-markdown'
Plug 'Alok/notational-fzf-vim'


Plug 'folke/which-key.nvim'

" temporary (things I'm testing out)
Plug 'mbbill/undotree'

call plug#end()
