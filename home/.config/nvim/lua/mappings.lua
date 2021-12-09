local map = vim.api.nvim_set_keymap
opts = {noremap = true, silent = true}

-- map the leader key
vim.g.mapleader = ";"

-- Clear search buffer on return
map('n', '<CR>', ':nohlsearch<CR>', opts)

-- telescope
map('n', '<leader>f', ':Telescope find_files<CR>', opts)
map('n', '<leader>be', [[<CMD>lua require("config.telescope").switch_buffer()<CR>]], opts)
map('n', '<leader>tg', ':Telescope live_grep<CR>', opts)

map('n', '<leader>tnf', [[<CMD>lua require("config.telescope").find_notes()<CR>]], opts)
map('n', '<leader>tng', [[<CMD>lua require("config.telescope").grep_notes()<CR>]], opts)
map('n', '<leader>tdf', [[<CMD>lua require("config.telescope").find_dots()<CR>]], opts)
map('n', '<leader>tdg', [[<CMD>lua require("config.telescope").grep_dots()<CR>]], opts)
map('n', '<leader>tbl', [[<CMD>lua require("config.telescope").buffer_lines()<CR>]], opts)

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

-- magit in vim?
map('n', '<leader>gg', [[<CMD>term <CR> i emacsclient -nw -e "(magit-status)" <CR>]], opts)

-- move from the terminal
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.api.nvim_exec(
  [[
  augroup jschoolcraft
    autocmd! TermOpen term://* lua set_terminal_keymaps()
  augroup end
  ]], false
)
