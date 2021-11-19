" plugin specific configuration

" vim-closetag
let g:closetag_filenames = '*.xml,*.html,*.xhtml,*.js,*.jsx,*.erb'

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0

let g:ale_linters = {'ruby': ['rubocop', 'brakeman', 'ruby']}
let g:ale_fixers  = {'ruby': ['rubocop']}
" let g:ale_linters = {'ruby': ['standardrb']}
" let g:ale_fixers  = {'ruby': ['standardrb']}

let g:ale_fix_on_save = 0

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"   - jump between linting errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" undotree
nnoremap <F5> :UndotreeToggle<cr>

" lightline
set noshowmode " we have mode in lightline, so this would be duplicate
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline.colorscheme='sonokai'

" autocmd bufwritepost *.js silent !standard --fix %
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

" deoplete
let g:deoplete#enable_at_startup = 1
set completeopt=longest,menuone,preview

" Dig through the tree of undo possibilities for your current file
nnoremap <F3> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom=1
let g:gundo_preview_height = 40

" fzf notational velocity
let g:nv_search_paths = ['~/Dropbox/jschoolcraft/notes']
let g:nv_default_extension = '.txt' " lots of files from nvalt still

" markdown
" to make syntax highlight work you need to match the language specified
" in the codefence with the filetype for highlighting, e.g. `ruby=rb`
let g:markdown_fenced_langagues = ['html', 'python=py', 'ruby=rb', 'bash=sh', 'sql']

" vimwiki
let g:vimwiki_list = [
  \{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'},
  \{'path': '~/vimwiki/work/octopi', 'syntax': 'markdown', 'ext': '.md'},
  \]
let g:vimwiki_folding='list'
