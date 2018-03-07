" ================ vim-plug Config =====================
" source: https://github.com/junegunn/vim-plug
" :PlugInstall

call plug#begin('~/.config/nvim/plugged')

" editing
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'alvan/vim-closetag'

" git
Plug 'tpope/vim-fugitive'

" finding things
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" rails
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'vim-scripts/rails.vim'

" linting
Plug 'w0rp/ale'

" elixir
Plug 'slashmili/alchemist.vim'

" auto-complete and snippets
Plug 'Shougo/deoplete.nvim', { 'do': '::UpdateRemotePlugins' }
Plug 'ervandew/supertab'

" react / react-native / javascript
Plug 'kchmck/vim-coffee-script'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-json'
Plug 'jelera/vim-javascript-syntax'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', {'do': 'yarn install', 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" colorschemes
Plug 'nightsense/vimspectr'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jsahlen/vim-ir_black'
Plug 'itchyny/landscape.vim'
Plug 'itchyny/lightline.vim' "airline replacements'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" wiki/notes/misc
Plug 'weierophinney/vimwiki'
Plug 'plasticboy/vim-markdown'
Plug 'Alok/notational-fzf-vim'

" temporary (things I'm testing out)
Plug 'tpope/vim-repeat' " Let's you repeat plugin commands, like surround
Plug 'tommcdo/vim-lion'  " Alignment (https://github.com/tommcdo/vim-lion)
Plug 'tpope/vim-eunuch'  " unix helpers (https://github.com/tpope/vim-eunuch)
Plug 'editorconfig/editorconfig-vim' " consistency with peers in projects

call plug#end()

