return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        '<leader>xt',
        '<cmd>Trouble todo toggle<cr>',
        desc = 'TODOs (Trouble)',
      },
    },
  }
}
