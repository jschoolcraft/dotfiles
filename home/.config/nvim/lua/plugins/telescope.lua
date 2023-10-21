return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'nvim-telescope/telescope-fzy-native.nvim' },
    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      -- NOTE: If you are having trouble with this installation,
      --       refer to the README for telescope-fzf-native for more instructions.
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
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
          '--smart-case'
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
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- crutch for fzf mappings
    -- vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = '[F]iles' })
    -- vim.keymap.set('n', '<leader>be', require('telescope.builtin').buffers, { desc = '[B]uffer [E]xplore' })

    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

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
