return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.nvim',
    },
    opts = {
      completions = {
        lsp = { enabled = true },
      },
    },
    keys = {
      {
        '<leader>mr',
        '<cmd>RenderMarkdown buf_toggle<cr>',
        ft = 'markdown',
        desc = 'Toggle Markdown rendering',
      },
      {
        '<leader>mp',
        '<cmd>RenderMarkdown preview<cr>',
        ft = 'markdown',
        desc = 'Preview Markdown beside source',
      },
    },
  },
}
