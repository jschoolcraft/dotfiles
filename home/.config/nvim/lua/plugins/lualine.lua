return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require("lualine").setup {
      options = {
        theme = "onedark"
      }
    }
  end,
  event = "VimEnter",
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
}
