return  {
  'hrsh7th/nvim-cmp',
  config = function ()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    vim.opt.completeopt = 'menu,menuone,noselect'

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      }),
    })
  end,
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
