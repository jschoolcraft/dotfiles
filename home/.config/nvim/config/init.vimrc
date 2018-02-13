" ================ vim-plug Config =====================
" source: https://github.com/junegunn/vim-plug
" :PlugInstall

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-surround'
Plug 'weierophinney/vimwiki'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/scratch.vim'
Plug 'godlygeek/tabular'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/rails.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Alok/notational-fzf-vim'
Plug 'alvan/vim-closetag'

" linting
Plug 'w0rp/ale'

" elixir
Plug 'slashmili/alchemist.vim'

" auto-complete and snippets
Plug 'Shougo/deoplete.nvim', { 'do': '::UpdateRemotePlugins' }
Plug 'ervandew/supertab'
" Plug 'joereynolds/vim-minisnip'
" Plug 'joereynolds/deoplete-minisnip', { 'do': '::UpdateRemotePlugins' }
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" react / react-native / javascript
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

" temporary (things I'm testing out)
Plug 'tommcdo/vim-lion'  " Alignment (https://github.com/tommcdo/vim-lion)
Plug 'tpope/vim-eunuch'  " unix helpers (https://github.com/tpope/vim-eunuch)
Plug 'itchyny/lightline.vim' "airline replacements'
Plug 'editorconfig/editorconfig-vim' " consistency with peers in projects

call plug#end()

