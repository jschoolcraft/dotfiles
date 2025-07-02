return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        copilot_node_command = vim.fn.expand("~/.local/share/mise/installs/node/20.17.0/bin/node"),
      })
    end,
  }
}
