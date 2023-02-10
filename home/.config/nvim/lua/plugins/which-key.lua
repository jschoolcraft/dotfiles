return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      plugins = {
        marks = true,
        registers = true,
      },
      ignore_missing = false,
    }
  end
}
