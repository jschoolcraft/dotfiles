return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = false },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      terminal = { enabled = true },
      zen = { enabled = true },
      scratch = { enabled = true },
    },
    keys = {
      { "<leader>gb", function() Snacks.git.blame_line() end, desc = "[G]it [B]lame line" },
      { "<leader>lg", function() Snacks.lazygit() end, desc = "[L]azy [G]it" },
      { "<leader>tt", function() Snacks.terminal() end, desc = "[T]erminal [T]oggle" },
      { "<leader>tz", function() Snacks.zen() end, desc = "[T]oggle [Z]en mode" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Scratch buffer" },
    },
  }
}
