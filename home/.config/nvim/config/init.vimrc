" ================ vim-plug Config =====================
" source: https://github.com/junegunn/vim-plug
" :PlugInstall

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/YankRing.vim'
Plug 'tpope/vim-surround'
Plug 'weierophinney/vimwiki'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/scratch.vim'
Plug 'godlygeek/tabular'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/syntastic'
Plug 'Gundo'
Plug 'rails.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Alok/notational-fzf-vim'

" react-native stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'

" auto-complete and snippets
Plug 'Shougo/deoplete.nvim', { 'do': '::UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" note taking
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'jsahlen/vim-ir_black'

" airline things
Plug 'myusuf3/numbers.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lilydjwg/colorizer', { 'on': 'ColorToggle' }
Plug 'wavded/vim-stylus'

call plug#end()
