-- tabs
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.expandtab = true

local tab_size = 2
vim.o.tabstop = tab_size
vim.o.shiftwidth = tab_size
vim.o.softtabstop = tab_size
vim.o.tabstop = tab_size

-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- search options
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true

-- disable redrawing during macros
vim.o.lazyredraw = true

-- enable mouse mode.
vim.o.mouse = 'a'

-- don't abandon unloaded buffers
vim.o.hidden = true

-- no swap files
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false

-- enable break indent.
vim.o.breakindent = true

-- scrolling (don't wait for boundaries)
vim.wo.scrolloff = 10
vim.wo.sidescrolloff = 30

-- decrease update time.
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- whitespace characters
vim.wo.list = true
vim.opt.listchars = "tab:→ ,trail:•,extends:»,precedes:«"

-- copy and paste with OS clipboard
vim.opt.clipboard = "unnamedplus"

-- colorscheme
vim.o.termguicolors = true
vim.g.t_Co = 256
vim.g.onedark_terminal_italics = 2
vim.o.background = "dark"
vim.cmd [[colorscheme onedark]]

-- highlight on yank
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]], false
)

vim.api.nvim_exec(
  [[
  augroup jschoolcraft
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=108

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
