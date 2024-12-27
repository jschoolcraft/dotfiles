-- map the leader key
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- things that i cba to categorize
vim.o.backspace = "indent,eol,start"

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

-- displaying text
vim.o.wrap = false
vim.o.linebreak = true

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

-- persistent undo
vim.o.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.o.undofile = true
vim.o.undolevels = 100
vim.o.undoreload = 1000

-- backup
vim.o.backupdir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.o.directory = os.getenv("HOME") .. "/.config/nvim/undodir"

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

-- better completion experience
-- vim.g.completeopt="menu,menuone,noselect,noinsert"

