local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Clear search buffer on return
keymap.set('n', '<CR>', ':nohlsearch<CR>', opts)

-- https://vonheikemen.github.io/devlog/tools/vim-and-the-quickfix-list/
-- quickfix list
keymap.set('n', '<leader>co', ':copen<CR>', opts)
keymap.set('n', '<leader>cc', ':cclose<CR>', opts)

-- fzf
keymap.set('n', '<leader>f', ':Files<CR>', opts)
keymap.set('n', '<leader>be', ':Buffers<CR>', opts)

-- quickfix list navigating items
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

-- When jump to next match also center screen
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

-- Q is annoying, remap it to run last macro
keymap.set('n', 'Q', '@@', opts)

-- Lazy
keymap.set('n', 'zz', ':Lazy<CR>', opts)

-- magit in vim?
-- keymap.set('n', '<leader>gg', [[<CMD>term <CR> i emacsclient -nw -e "(magit-status)" <CR>]], opts)

-- move from the terminal
-- function _G.set_terminal_keymaps()
--   local opts = { noremap = true }
--   vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
--   vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
-- end

-- vim.api.nvim_exec(
--   [[
--   augroup jschoolcraft
--     autocmd! TermOpen term://* lua set_terminal_keymaps()
--   augroup end
--   ]], false
-- )
