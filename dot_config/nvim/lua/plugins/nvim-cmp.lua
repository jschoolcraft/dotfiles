return  {
  'hrsh7th/nvim-cmp',
  dependencies = {
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "saadparwaiz1/cmp_luasnip" },
    { "kristijanhusak/vim-dadbod-completion" },
    { "rafamadriz/friendly-snippets" },
  },
  event = { "InsertEnter", "CmdlineEnter" },
}
