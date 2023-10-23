return {
  {
    'junegunn/fzf.vim',
    dependencies = {
      'junegunn/fzf',
      build = ':call fzf#install()',
    },
    lazy = false,
  },
}
