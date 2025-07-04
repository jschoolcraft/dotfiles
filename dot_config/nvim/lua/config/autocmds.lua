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

-- automatic theme switching based on system appearance
local function detect_system_theme()
  local handle = io.popen('defaults read -g AppleInterfaceStyle 2>/dev/null')
  local result = handle:read('*a')
  handle:close()

  if result and result:match('Dark') then
    return 'darker'
  else
    return 'light'
  end
end

local function set_theme_based_on_system()
  local system_theme = detect_system_theme()
  local onedark = require('onedark')

  if system_theme == 'darker' then
    onedark.setup({
      style = 'darker',
      term_colors = true,
      toggle_style_key = '<leader>ts',
      toggle_style_list = {'light', 'darker'},
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },
    })
  else
    onedark.setup({
      style = 'light',
      term_colors = true,
      toggle_style_key = '<leader>ts',
      toggle_style_list = {'light', 'darker'},
      code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
      },
    })
  end

  onedark.load()
end

-- set theme on startup
vim.api.nvim_create_autocmd('VimEnter', {
  callback = set_theme_based_on_system,
  group = jschoolcraft_group,
})

-- check for system theme changes when focus returns to nvim
vim.api.nvim_create_autocmd('FocusGained', {
  callback = set_theme_based_on_system,
  group = jschoolcraft_group,
})
