local jschoolcraft_group = vim.api.nvim_create_augroup('jschoolcraft', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost',  {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  pattern = '*',
})

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 108
    vim.opt_local.syntax = 'markdown.pandoc'
  end,
  group = jschoolcraft_group,
  pattern = '*.md',
})

-- set textwidth all text files
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.textwidth = 108
  end,
  group = jschoolcraft_group,
  pattern = 'text',
})

-- set spell for all text files
vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.spell = true
  end,
  group = jschoolcraft_group,
  pattern = 'text',
})

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.cmd([[%s/\s\+$//e]])
  end,
  group = jschoolcraft_group,
  pattern = '*',
})

-- always jump to the last known cursor position
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    vim.cmd([[
      if line("'\"") > 1 && line("'\"") <= line("$")
        exe "normal! g`\""
      endif
    ]])
  end,
  group = jschoolcraft_group,
  pattern = '*',
})
