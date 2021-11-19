if not packer_plugins['plenary.nvim'].loaded then
  vim.cmd [[packadd plenary.nvim]]
  vim.cmd [[packadd popup.nvim]]
  vim.cmd [[packadd telescope-fzy-native.nvim]]
end

local ok, telescope = pcall(require, 'telescope')
if not ok then return end

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
