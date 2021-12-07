local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local custom_actions = {}
local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = '🔭 ',
  },
})

local M = { }

function M.find_notes()
  local opts = { }
  opts.prompt_title = " Find Notes"
  opts.path_display = { "smart" }
  opts.search_dirs = {
    "~/vimwiki",
    "~/Dropbox/org",
    "~/Dropbox/jschoolcraft/notes",
    --   -- "~/Dropbox/jschoolcraft/obsidian",
  }

  require("telescope.builtin").find_files(opts)
end

function M.grep_notes()
  local opts = { }
  opts.prompt_title = " Search Notes"
  opts.path_display = { "smart" }
  opts.search_dirs = {
    "~/vimwiki",
    "~/Dropbox/org",
    "~/Dropbox/jschoolcraft/notes",
    -- "~/Dropbox/jschoolcraft/obsidian",
  }

  require("telescope.builtin").live_grep(opts)
end

function M.find_dots()
  local opts = { }
  opts.prompt_title = " Find Dots"
  opts.path_display = { "smart" }
  opts.search_dirs = {
    "~/code/dotfiles"
  }

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


return M
