return {
  {
    "folke/twilight.nvim",
    opts = {
    },
    cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
  },
  {
    "folke/zen-mode.nvim",
    opts = {
      plugins = {
        kitty = {
          enabled = true,
          font = "+4",
        },
      }
    },
    cmd = { 'ZenMode' },
  }
}
