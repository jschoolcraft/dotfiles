require('nvim-treesitter.configs').setup({
  -- if you want absolutely everything then use `'maintained'`
  ensure_installed = 'maintained',

  -- or to pick and choose:
  --[[
  ensure_installed = {
    'ruby',
    'yaml',
    'markdown',
    'lua',
    'typescript',
    'css',
    'scss',
    'html',
    'bash',
    'dockerfile',
    'graphql',
    'json',
  },
  ]]--
  highlight = { enable = true, additional_vim_regex_highlighting = false },
  autotag = { enable = true },
})
