local jschoolcraft_group = vim.api.nvim_create_augroup('jschoolcraft', { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost',  {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    vim.opt_local.suffixesadd:append('.md')
    vim.opt_local.spell = true
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 108
  end,
  group = jschoolcraft_group,
  pattern = 'markdown',
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

-- pick up files changed by agents and other external tools
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold' }, {
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
  group = jschoolcraft_group,
})

-- remove trailing whitespace on save, except where it is meaningful (Markdown, diffs)
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    if not vim.bo[args.buf].modifiable or vim.tbl_contains({ 'markdown', 'diff' }, vim.bo[args.buf].filetype) then
      return
    end

    local view = vim.fn.winsaveview()
    vim.cmd([[silent! keepjumps keeppatterns %s/\s\+$//e]])
    vim.fn.winrestview(view)
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
  if not handle then
    return 'darker'
  end

  local result = handle:read('*a')
  handle:close()
  return result and result:match('Dark') and 'darker' or 'light'
end

local current_system_theme

local function set_theme_based_on_system()
  local system_theme = detect_system_theme()
  if system_theme == current_system_theme then
    return
  end

  local onedark = require('onedark')
  onedark.setup({
    style = system_theme,
    term_colors = true,
    toggle_style_key = '<leader>ts',
    toggle_style_list = { 'light', 'darker' },
    code_style = {
      comments = 'italic',
      keywords = 'none',
      functions = 'none',
      strings = 'none',
      variables = 'none',
    },
  })
  onedark.load()
  current_system_theme = system_theme
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
