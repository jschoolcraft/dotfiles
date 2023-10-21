return {
  {
    "fatih/vim-go",
    config = function ()
      -- we disable most of these features because treesitter and nvim-lsp
      -- take care of it
      vim.g['go_gopls_enabled'] = 0
      vim.g['go_code_completion_enabled'] = 0
      vim.g['go_fmt_autosave'] = 1
      vim.g['go_imports_autosave'] = 1
      vim.g['go_mod_fmt_autosave'] = 1
      vim.g['go_doc_keywordprg_enabled'] = 0
      vim.g['go_def_mapping_enabled'] = 0
      vim.g['go_textobj_enabled'] = 0
      vim.g['go_list_type'] = 'quickfix'
    end,
  },
}
