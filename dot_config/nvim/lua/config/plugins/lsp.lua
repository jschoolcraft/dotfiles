return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config('lua_ls', { capabilities = capabilities })
      vim.lsp.config('ruby_lsp', { capabilities = capabilities })

      vim.lsp.enable('lua_ls')
      vim.lsp.enable('ruby_lsp')
    end,
  }
}
