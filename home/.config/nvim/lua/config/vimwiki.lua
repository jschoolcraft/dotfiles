local g = vim.g
g.wiki_list = {
  {
    path = "~/Dropbox/vimwiki",
    syntax = "markdown",
    ext = ".md",
  },
  {
    path = '~/vimwiki',
    syntax = 'markdown',
    ext = '.md',
  },
  {
    path = '~/vimwiki/work/octopi',
    syntax = 'markdown',
    ext = '.md'
  },
}
g.vimwiki_ext2syntax = {
  [".md"] = "markdown",
  [".markdown"] = "markdown",
  [".mdown"] = "markdown",
}
g.vimwiki_global_ext = 0
