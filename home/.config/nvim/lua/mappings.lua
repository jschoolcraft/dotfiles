local map = vim.api.nvim_set_keymap
opts = {noremap = true, silent = true}

-- map the leader key
vim.g.mapleader = ";"

-- Clear search buffer on return
map('n', '<CR>', ':nohlsearch<CR>', opts)

-- telescope
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>be', ':Telescope buffers<CR>', opts)
map('n', '<leader>tg', ':Telescope live_grep<CR>', opts)

map('n', '<leader>tnf', [[<CMD>lua require("config.telescope").find_notes()<CR>]], opts)
map('n', '<leader>tng', [[<CMD>lua require("config.telescope").grep_notes()<CR>]], opts)
map('n', '<leader>tdf', [[<CMD>lua require("config.telescope").find_dots()<CR>]], opts)
map('n', '<leader>tdg', [[<CMD>lua require("config.telescope").grep_dots()<CR>]], opts)

-- windows
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-h>', '<C-w>h', opts)

-- Don't yank to default register when changing something
map('n', 'c', '"xc', opts)
map('x', 'c', '"xc', opts)
-- xnoremap c "xc

-- When jump to next match also center screen
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)
map('v', 'n', 'nzzzv', opts)
map('v', 'N', 'Nzzzv', opts)

-- Join lines, keep cursor where it was
map('n', 'J', 'mzJ`z', opts)

-- Same when moving up and down
map('n', '<C-u>', '<C-u>zz', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-f>', '<C-f>zz', opts)
map('n', '<C-b>', '<C-b>zz', opts)
map('v', '<C-u>', '<C-u>zz', opts)
map('v', '<C-d>', '<C-d>zz', opts)
map('v', '<C-f>', '<C-f>zz', opts)
map('v', '<C-b>', '<C-b>zz', opts)

-- Q is annoying, remap it to run last macro
map('n', 'Q', '@@', opts)
