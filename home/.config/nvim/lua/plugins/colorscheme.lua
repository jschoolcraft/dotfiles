return {
  { "navarasu/onedark.nvim", },
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 999,
    config = function()
      require("onedarkpro").setup({
        theme = "darker",
        styles = {
          comments = "italic",
          functions = "italic",
          keywords = "italic",
          strings = "italic",
          variables = "italic",
        },
      })
      vim.cmd.colorscheme "onedark"
    end,
  },
  { "arcticicestudio/nord-vim", },
  { "rakr/vim-one", },
  { "sainnhe/sonokai", },
  { 'EdenEast/nightfox.nvim' },
}
