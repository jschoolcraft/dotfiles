return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local custom_actions = {}
    local telescope = require("telescope")

    telescope.setup({
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
            ["<Esc>"] = require("telescope.actions").close
          },
          n = {
            ["<Esc>"] = require("telescope.actions").close
          },
        },
      },
    })

    local M = { }


    local notes_dirs = {
      "~/vimwiki",
      "~/Dropbox/org",
      "~/Dropbox/jschoolcraft/notes",
      "~/Dropbox/jschoolcraft/obsidian",
    }

    function M.find_notes()
      local opts = { }
      opts.prompt_title = " Find Notes"
      opts.path_display = { "smart" }
      opts.search_dirs = notes_dirs

      require("telescope.builtin").find_files(opts)
    end

    function M.grep_notes()
      local opts = { }
      opts.prompt_title = " Search Notes"
      opts.path_display = { "smart" }
      opts.search_dirs = notes_dirs

      require("telescope.builtin").live_grep(opts)
    end

    function M.find_dots()
      local opts = { }
      opts.prompt_title = " Find Dots"
      opts.path_display = { "smart" }
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
        "~/code/dotfiles"
      }
      opts.hidden = true

      require("telescope.builtin").find_files(opts)
    end

    function M.grep_dots()
      local opts = { }
      opts.prompt_title = " Search Dots"
      opts.path_display = { "smart" }
      opts.search_dirs = {
        "~/code/dotfiles"
      }

      require("telescope.builtin").live_grep(opts)
    end

    function M.switch_buffer()
      local opts = { }

      opts.prompt_title = " Switch Buffer"
      opts.ignore_current_buffer = true
      opts.sort_mru = true
      require("telescope.builtin").buffers(opts)
    end

    function M.buffer_lines()
      local opts = { }
      opts.prompt_title = " Search Buffer"
      opts.skip_empty_lines = true

      require("telescope.builtin").current_buffer_fuzzy_find(opts)
    end

    return M
  end
}
