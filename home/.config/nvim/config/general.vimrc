" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.config/nvim/.vimrc.before"))
  source ~/.config/nvim/.vimrc.before
endif

filetype plugin on
filetype indent on

" ================ General Config ====================

set number                      "Line numbers are good
set relativenumber              "Relative line numbers are better
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set ruler

set autoread                    "Reload files changed outside vim

set lazyredraw                  "Don't need every step of the macro drawn

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
set undodir=~/.config/nvim/undodir
set undofile
set undolevels=100
set undoreload=1000

" backup
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup

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
set wildignore+=*/node_modules/*,*/bower_components/*

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
set background=dark
"colorscheme ir_black
colorscheme landscape
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
   colorscheme landscape
endif

if &t_Co > 2 || has("gui_running")
   syntax on
endif


" Insert a => on <c-l>
imap <c-l> <space>=><space>
" cba ESC vs <c-c>
imap <c-c> <esc>

" Clear search buffer on return
:nnoremap <CR> :nohlsearch<cr>

set cursorline
set cmdheight=2
set laststatus=2
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.nviminfo
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}


" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" format json from selection
vnoremap <leader>j :!python -m json.tool<CR>

" shut up vim
set shortmess=atI

" sudo write this
cmap W! w !sudo tee % >/dev/null

if has("autocmd")

  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=108

    " Trim whitespace onsave
    autocmd BufWritePre * %s/\s\+$//e

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END
endif " has("autocmd")

" detect .md as markdown instead of modula-2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Unix as standard file type
set ffs=unix,dos,mac

" Always utf8
set termencoding=utf-8
" set encoding=utf-8
set fileencoding=utf-8

function TrimTrailingWhiteSpace()
  silent! %s/\s*$//
  nohl
:endfunction

"kill whitespace and highlight
nnoremap <silent> <F5> :call TrimTrailingWhiteSpace()<CR>

" Toggle Paste Mode
set pastetoggle=<F2>

" clipboard
set clipboard=unnamedplus
