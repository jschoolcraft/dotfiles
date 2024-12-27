return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
      },
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = { }
        }
      }

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>f", require('telescope.builtin').find_files, { desc = '[F]ind files' })
      vim.keymap.set("n", "<leader>be", require('telescope.builtin').buffers, { desc = '[B]uffer [e]dit' })

      -- edit neovim config files
      vim.keymap.set("n", "<leader>en", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath("config")
        }
      end,
        { desc = '[E]dit [n]eovim config files' }
      )

      -- edit package (installed neovim plugin packages)
      vim.keymap.set("n", "<leader>ep", function()
        require('telescope.builtin').find_files {
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end,
        { desc = '[E]dit [p]ackages from lazy.nvim' }
      )


      vim.keymap.set('n', '<leader>tgf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>tsf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>tsh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>tsw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>tsg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>tsd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>tsq', require('telescope.builtin').quickfix, { desc = '[S]earch [Q]uickfix' })
      vim.keymap.set('n', '<leader>tsc', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })

      require "config.telescope.multigrep".setup()
      require "config.telescope.notes".setup()
    end
  }
}
