return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        copilot_node_command = vim.fn.system("mise where node@20"):gsub("\n", "") .. "/bin/node",
      })
    end,
  }
}
