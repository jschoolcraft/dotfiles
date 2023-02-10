return {
  "folke/trouble.nvim",
  dependencies = "kyazdani42/nvim-web-devicons",
  cmd = {"TroubleToggle", "Trouble"},
  config = function()
    require("trouble").setup({})
  end
}

