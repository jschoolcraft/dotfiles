local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Clear search buffer on return
keymap.set('n', '<CR>', ':nohlsearch<CR>', opts)

-- quickfix list
-- https://vonheikemen.github.io/devlog/tools/vim-and-the-quickfix-list/
keymap.set('n', '<leader>co', ':copen<CR>', opts)
keymap.set('n', '<leader>cc', ':cclose<CR>', opts)
keymap.set('n', '[q', ':cprev<CR>', opts)
keymap.set('n', ']q', ':cnext<CR>', opts)

-- windows
keymap.set('n', '<C-j>', '<C-w>j', opts)
keymap.set('n', '<C-k>', '<C-w>k', opts)
keymap.set('n', '<C-l>', '<C-w>l', opts)
keymap.set('n', '<C-h>', '<C-w>h', opts)

-- Don't yank to default register when changing something
-- map('n', 'c', '"xc', opts)
-- map('x', 'c', '"xc', opts)
-- xnoremap c "xc

-- When jumping to the next match also center screen
keymap.set('n', 'n', 'nzzzv', opts)
keymap.set('n', 'N', 'Nzzzv', opts)
keymap.set('v', 'n', 'nzzzv', opts)
keymap.set('v', 'N', 'Nzzzv', opts)

-- Join lines, keep cursor where it was
keymap.set('n', 'J', 'mzJ`z', opts)

-- Same when moving up and down
keymap.set('n', '<C-u>', '<C-u>zz', opts)
keymap.set('n', '<C-d>', '<C-d>zz', opts)
keymap.set('n', '<C-f>', '<C-f>zz', opts)
keymap.set('n', '<C-b>', '<C-b>zz', opts)
keymap.set('v', '<C-u>', '<C-u>zz', opts)
keymap.set('v', '<C-d>', '<C-d>zz', opts)
keymap.set('v', '<C-f>', '<C-f>zz', opts)
keymap.set('v', '<C-b>', '<C-b>zz', opts)

-- undo tree
keymap.set('n', '<leader>tu', ':UndotreeToggle<CR>', opts)
