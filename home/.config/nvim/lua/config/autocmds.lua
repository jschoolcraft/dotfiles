-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

--
vim.api.nvim_exec(
  [[
  augroup jschoolcraft
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=108

    " For gitcommit files set spell and textwidth
    autocmd FileType text setlocal spell textwidth=72

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif
  augroup end
  ]], false
)

-- Remove all trailing whitespace on save
vim.api.nvim_exec([[
  augroup TrimWhiteSpace
    au!
    autocmd BufWritePre * :%s/\s\+$//e
  augroup END
  ]], false)
