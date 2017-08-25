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

" vim-closetag
let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.js,*.jsx,*.erb'

" trying Ultisnips, again
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" ale
let g:airline#extensions#ale#enabled = 1
"   - jump between linting errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

autocmd bufwritepost *.js silent !standard --fix %
set autoread

" javascript stuff
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" vim-jsx
let g:jsx_ext_required = 0

" deoplete
let g:deoplete#enable_at_startup = 1

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" Dig through the tree of undo possibilities for your current file
nnoremap <F3> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom=1
let g:gundo_preview_height = 40

" YankRing plugin to manage yanked/deleted buffers
nnoremap <silent> <F7> :YRShow<CR>
let g:yankring_history_file = '.yankring-history'
let g:yankring_zap_keys = 'f F t T / ?'

" fzf notational velocity
let g:nv_directories = ['~/Dropbox/jschoolcraft/notes']

