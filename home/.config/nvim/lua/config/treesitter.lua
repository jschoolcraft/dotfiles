require('nvim-treesitter.configs').setup({
  -- if you want absolutely everything then use `'maintained'`
  -- ensure_installed = 'maintained',

  -- or to pick and choose:
  ensure_installed = {
    'bash',
    'css',
    'dockerfile',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'regex',
    'ruby',
    'scss',
    'typescript',
    'yaml',
  },
  highlight = {
    enable = true,
    disable = { },
  },
  indent = {
    enable = false,
    disable = { },
  },
  autopairs = {{
    enable = true
  }},
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 3000
  }
})
