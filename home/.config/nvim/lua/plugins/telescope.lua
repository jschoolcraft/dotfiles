return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      config = function()
        require('telescope').load_extension('fzf')
      end
    },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        prompt_prefix = '🔭 ',
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--trim',
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<Esc>'] = require('telescope.actions').close
          },
          n = {
            ['<Esc>'] = require('telescope.actions').close
          },
        },
        file_ignore_patterns = { 'node_modules' },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          },
        },
      },
    }

    local M = { }
    local notes_dirs = {
      '~/vimwiki',
      '~/Dropbox/org',
      '~/Dropbox/jschoolcraft/notes',
      '~/Dropbox/jschoolcraft/obsidian',
    }

    function M.find_notes()
      local opts = { }
      opts.prompt_title = ' Find Notes'
      opts.path_display = { 'smart' }
      opts.search_dirs = notes_dirs
      opts.extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
      }

      require('telescope.builtin').find_files(opts)
    end

    function M.grep_notes()
      local opts = { }
      opts.prompt_title = ' Search Notes'
      opts.path_display = { 'smart' }
      opts.search_dirs = notes_dirs

      require('telescope.builtin').live_grep(opts)
    end

    function M.find_dots()
      local opts = { }
      opts.prompt_title = ' Find Dots'
      opts.path_display = { 'smart' }
      opts.find_command = {
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--ignore=dotbot'
      }
      opts.search_dirs = {
        '~/code/dotfiles'
      }
      opts.hidden = true

      require('telescope.builtin').find_files(opts)
    end

    function M.grep_dots()
      local opts = { }
      opts.prompt_title = ' Search Dots'
      opts.path_display = { 'smart' }
      opts.search_dirs = {
        '~/code/dotfiles'
      }

      require('telescope.builtin').live_grep(opts)
    end

    function M.switch_buffer()
      local opts = { }

      opts.prompt_title = ' Switch Buffer'
      opts.ignore_current_buffer = true
      opts.sort_mru = true
      require('telescope.builtin').buffers(opts)
    end

    function M.buffer_lines()
      local opts = { }
      opts.prompt_title = ' Search Buffer'
      opts.skip_empty_lines = true

      require('telescope.builtin').current_buffer_fuzzy_find(opts)
    end

    vim.keymap.set('n', '<leader>tnf', M.find_notes, { desc = '[N]otes [F]ind' })
    vim.keymap.set('n', '<leader>tng', M.grep_notes, { desc = '[N]otes [G]rep' })
    vim.keymap.set('n', '<leader>tdf', M.find_dots, { desc = '[D]otfiles [F]ind' })
    vim.keymap.set('n', '<leader>tdg', M.grep_dots, { desc = '[D]otfiles [G]rep' })
    return M

  end
}
