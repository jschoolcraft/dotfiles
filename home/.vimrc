" a lot of this pulled from:
" https://github.com/skwp/dotfiles
"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ Vundle Config =====================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

if filereadable(expand("~/.vim/vundles.vim"))
  call vundle#begin()
  source ~/.vim/vundles.vim
  call vundle#end()            " required
endif

filetype plugin on
filetype indent on

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink

set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Fix some FileTypes  ==================

au BufNewFile,BufRead Gemfile set filetype=ruby
au BufNewFile,BufRead Guardfile set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works in MacVim (gui) mode.

if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest,full
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.swp,*.dll,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,.git,tmp,*.log,*~,.svn,.hg
set wildignore+=*vim/backups*

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set background=dark
colorscheme ir_black
" utf-8 default encoding
set enc=utf-8

" apparently this is an exploit
set nomodeline

" prefer unix over windows over os9 formats
set fileformats=unix,dos,mac

" don't bell or blink
set noerrorbells
set vb t_vb=

" keep some more lines for scope
set scrolloff=5

set t_Co=256
if &t_Co >= 256 || has("gui_running")
   syntax on
   colorscheme ir_black
endif

if &t_Co > 2 || has("gui_running")
   syntax on
endif

let mapleader=';'
nnoremap ' `
nnoremap ` '

" move around windows a little faster
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>f :CtrlP<CR>
nmap <silent> <leader>be :CtrlPBuffer<CR>

" Let's make it easy to find files I use all the time
map <leader>jv :CtrlP app/views<cr>
map <leader>jc :CtrlP app/controllers<cr>
map <leader>jm :CtrlP app/models<cr>
map <leader>jh :CtrlP app/helpers<cr>
map <leader>jl :CtrlP lib<cr>
map <leader>jp :CtrlP public<cr>
map <leader>js :CtrlP public/stylesheets/sass<cr>
map <leader>jf :CtrlP features<cr>

" Insert a => on <c-l>
imap <c-l> <space>=><space>
" cba ESC vs <c-c>
imap <c-c> <esc>

" Clear search buffer on return
:nnoremap <CR> :nohlsearch<cr>

set ruler
set cmdheight=2
set laststatus=2
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set showcmd
set number

" The Silver Searcher
if executable('ag')
  " Use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  " make ctrlp a bit faster
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'

  " ag is fast enough
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" cool status line
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '¶'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

" trying Ultisnips, again
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" shut up vim
set shortmess=atI

" sudo write this
cmap W! w !sudo tee % >/dev/null

function TrimTrailingWhiteSpace()
  silent! %s/\s*$//
  nohl
:endfunction

"kill whitespace and highlight
nnoremap <silent> <F5> :call TrimTrailingWhiteSpace()<CR>

" YankRing plugin to manage yanked/deleted buffers
nnoremap <silent> <F7> :YRShow<CR>
let g:yankring_history_file = '.yankring-history'
let g:yankring_zap_keys = 'f F t T / ?'

" Toggle Paste Mode
set pastetoggle=<F2>

" Dig through the tree of undo possibilities for your current file
nnoremap <F3> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom=1
let g:gundo_preview_height = 40
