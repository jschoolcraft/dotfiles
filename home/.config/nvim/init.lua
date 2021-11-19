require("options")

vim.defer_fn(function()
  require("maps")
  require("plugins.manager")
  require("plugins")
end, 0)
