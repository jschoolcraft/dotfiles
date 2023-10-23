return {
  'TimUntersberger/neogit',
  cmd = 'Neogit',
  config = function()
    require("neogit").setup {
      disable_commit_confirmation = true
    }
  end
}
