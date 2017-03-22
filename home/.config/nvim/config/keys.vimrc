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
nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>be :Buffers<CR>

