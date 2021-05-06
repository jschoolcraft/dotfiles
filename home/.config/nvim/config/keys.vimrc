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

" fzf
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>be :Buffers<CR>
nmap <silent> <leader>l :Lines<CR>
nmap <silent> <leader>bl :BLines<CR>
" more fzf that I'm not using right now
" :Marks
" :Helptags  "vim's :help documentation
" :Helptags! "vim's :help documentation full screen
" :BTags     "tags in the current buffer
" :Tags      "tags in the current project
" :Commands  "vim's defined commands
" :History:  "command history
" :Maps      "key mappings

" Don't yank to default register when changing something
nnoremap c "xc
xnoremap c "xc

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" Macros
nnoremap Q @@
nnoremap Y y$
