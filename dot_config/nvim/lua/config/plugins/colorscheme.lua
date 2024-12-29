return {
  {
    "navarasu/onedark.nvim",
    priority = 999,
    config = function()
      require("onedark").setup({
        style ="darker",
        term_colors = true,

        -- toggle theme style ---
        toggle_style_key = "<leader>ts", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = {'light', 'darker'}, -- List of styles to toggle between
        -- toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },
      })
      require("onedark").load()
    end,
  },
}
