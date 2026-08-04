return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/site")

      require("nvim-treesitter").install({
        "bash", "c", "cmake", "cpp", "css", "diff", "dockerfile", "fish",
        "gitignore", "go", "graphql", "html", "javascript", "jsdoc",
        "json", "jsonc", "lua", "markdown", "markdown_inline", "python",
        "query", "regex", "ruby", "scss", "sql", "toml", "typescript", "vim",
        "vimdoc", "vue", "yaml",
      })

      local max_filesize = 100 * 1024

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local buf = ev.buf
          local ft = vim.bo[buf].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft

          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return
          end

          if not pcall(vim.treesitter.language.add, lang) then
            return
          end

          pcall(vim.treesitter.start, buf, lang)

          if ft == "ruby" then
            vim.bo[buf].syntax = "ON"
          else
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
