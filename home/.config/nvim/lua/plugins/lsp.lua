return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "ray-x/lsp_signature.nvim" },

    -- configure formatters & linters
    { "jose-elias-alvarez/null-ls.nvim" },
    { "jayp0521/mason-null-ls.nvim" },
    -- {'MunifTanjim/prettier.nvim'},

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "onsails/lspkind.nvim" },

    -- Snippets
    { "L3MON4D3/LuaSnip" },
    -- { "rafamadriz/friendly-snippets" },
    -- use snipmate/ultisnip style snippets instead
    -- this has a lot more stars, and a little less problematic in ruby
    -- https://github.com/VonHeikemen/lsp-zero.nvim/issues/61
    { "honza/vim-snippets" },

    -- use command output as LSP for places that don't have one yet
    { "jose-elias-alvarez/null-ls.nvim" },
    { "jayp0521/mason-null-ls.nvim"},
  },
  config = function()
    local lsp = require("lsp-zero")
    lsp.preset("recommended")

    lsp.ensure_installed({
      "tsserver",
      "eslint",
      "rust_analyzer",
      "lua_ls",
      "gopls",
      "jsonls",
      "solargraph",
      "terraformls",
      "yamlls",
      "solc",
    })

    lsp.on_attach(function(_, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    end)

    vim.o.updatetime = 250
    vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float({focus=false})]])

    lsp.nvim_workspace()
    lsp.setup()
  end
}
