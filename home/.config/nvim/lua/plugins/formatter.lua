return  {
  "mhartington/formatter.nvim",
  config = function()
    local formatters = {
      prettier = function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
          },
          stdin = true,
        }
      end,
      rufo = function()
        return {
          exe = "rufo",
          stdin = true,
        }
      end,
    }

    require("formatter").setup({
      filetype = {
        ruby = { formatters.rufo },
        javascript = { formatters.prettier },
        javascriptreact = { formatters.prettier },
        json = { formatters.prettier },
        scss = { formatters.prettier },
        css = { formatters.prettier },
        less = { formatters.prettier },
        yaml = { formatters.prettier },
        vue = { formatters.prettier },
        html = { formatters.prettier },
        typescriptreact = { formatters.prettier },
        typescript = { formatters.prettier },
        markdown = { formatters.prettier },
      },
    })
  end
}
