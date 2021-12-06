local map = require('utils').map
local opts = { noremap=true, silent=true }

-- Clear search buffer on return
map('n', '<CR>', ':nohlsearch<CR>', opts)

-- telescope
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>be', ':Telescope buffers<CR>', opts)
map('n', '<leader>tg', ':Telescope live_grep<CR>', opts)

map('n', '<leader>tnf', [[<CMD>lua require("plugins.config.telescope").find_notes()<CR>]], opts)
map('n', '<leader>tng', [[<CMD>lua require("plugins.config.telescope").grep_notes()<CR>]], opts)
map('n', '<leader>tdf', [[<CMD>lua require("plugins.config.telescope").find_dots()<CR>]], opts)
map('n', '<leader>tdg', [[<CMD>lua require("plugins.config.telescope").grep_dots()<CR>]], opts)

-- windows
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
map('n', '<C-h>', '<C-w>h')

-- Don't yank to default register when changing something
map('n', 'c', '"xc')
map('x', 'c', '"xc')
-- xnoremap c "xc

-- When jump to next match also center screen
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('v', 'n', 'nzzzv')
map('v', 'N', 'Nzzzv')

-- Join lines, keep cursor where it was
map('n', 'J', 'mzJ`z')

-- Same when moving up and down
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-f>', '<C-f>zz')
map('n', '<C-b>', '<C-b>zz')
map('v', '<C-u>', '<C-u>zz')
map('v', '<C-d>', '<C-d>zz')
map('v', '<C-f>', '<C-f>zz')
map('v', '<C-b>', '<C-b>zz')

-- Q is annoying, remap it to run last macro
map('n', 'Q', '@@')
