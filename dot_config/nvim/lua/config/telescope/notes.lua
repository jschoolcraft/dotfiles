local notes_dirs = {
  '~/vimwiki',
  '~/Dropbox/org',
  '~/Dropbox/jschoolcraft/notes',
  '~/Dropbox/jschoolcraft/obsidian',
}

local M = {}

local grep_notes = function(opts)
  opts = opts or {}
  opts.search_dirs = opts.search_dirs or notes_dirs

  opts.prompt_title = ' Search Notes'
  opts.path_display = { 'smart' }

  require('telescope.builtin').live_grep(opts)
end

local find_notes =function(opts)
  opts = opts or {}
  opts.search_dirs = opts.search_dirs or notes_dirs

  opts.prompt_title = ' Find Notes'
  opts.path_display = { 'smart' }

  require('telescope.builtin').find_files(opts)
end

M.setup = function()
  vim.keymap.set('n', '<leader>tnf', find_notes, { desc = '[N]otes [F]ind' })
  vim.keymap.set('n', '<leader>tng', grep_notes, { desc = '[N]otes [G]rep' })
end

return M
