return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
        end

        map(']h', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end, 'Next Git hunk')

        map('[h', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end, 'Previous Git hunk')

        map('<leader>hp', gitsigns.preview_hunk, '[H]unk [P]review')
        map('<leader>hr', gitsigns.reset_hunk, '[H]unk [R]eset')
      end,
    },
  },
}
