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

" rails
Plug 'tpope/vim-rails'

" linting
Plug 'w0rp/ale'

" elixir
" Plug 'slashmili/alchemist.vim'

" view stuff
Plug 'myusuf3/numbers.vim' " intelligently toggling line numbers

" auto-complete and snippets
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

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

" temporary (things I'm testing out)
Plug 'mbbill/undotree'

call plug#end()
