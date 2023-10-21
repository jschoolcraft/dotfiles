return {
  -- writing, notes and things
  'vim-pandoc/vim-pandoc',

  {
    'rwxrob/vim-pandoc-syntax-simple',
    -- vim-pandoc's version has funky heading symbols
    -- 'vim-pandoc/vim-pandoc-syntax',
    dependencies = {
      { 'vim-pandoc/vim-pandoc' }
    }
  },
}
