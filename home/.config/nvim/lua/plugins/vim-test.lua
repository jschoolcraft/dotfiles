return {
  'vim-test/vim-test',
  config = function()
    vim.api.nvim_set_var('test#strategy', 'neovim')
  end,
  lazy = false,
}
