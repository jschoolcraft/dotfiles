" plugin specific configuration

" The Silver Searcher
if executable('ag')
  " Use ag instead of grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --vimgrep'

  " make ctrlp a bit faster
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ --ignore "node_modules"
        \ -g ""'

  " ag is fast enough
  let g:ctrlp_use_caching = 0
endif

" trying Ultisnips, again
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" deoplete
let g:deoplete#enable_at_startup = 1

" Dig through the tree of undo possibilities for your current file
nnoremap <F3> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom=1
let g:gundo_preview_height = 40

" note taking
let g:notes_directories = ['~/Dropbox/jschoolcraft/notes']
let g:notes_suffix = '.txt'
let g:notes_title_sync = 'no'

" YankRing plugin to manage yanked/deleted buffers
nnoremap <silent> <F7> :YRShow<CR>
let g:yankring_history_file = '.yankring-history'
let g:yankring_zap_keys = 'f F t T / ?'

" fzf notational velocity
let g:nv_directories = ['~/Dropbox/jschoolcraft/notes']

