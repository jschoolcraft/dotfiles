return {
  { 'nvim-lua/plenary.nvim', module = 'plenary' },
  { 'nvim-lua/popup.nvim', module = 'popup' },

  -- find all the things
  {
    "junegunn/fzf",
    dependencies = {
      { "junegunn/fzf.vim" }
    },
  },

  "jremmen/vim-ripgrep",

  { 'nvim-telescope/telescope-fzy-native.nvim' },

  {
    "cuducos/yaml.nvim",
    ft = { "yaml" },
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
      { "nvim-telescope/telescope.nvim" },
    },
  },

  -- quality of life things
  'tpope/vim-surround',
  'mechatroner/rainbow_csv',

  'sbdchd/neoformat',

  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').add_default_mappings()
    end
  },

  "mbbill/undotree",

  'slim-template/vim-slim',

  -- rails
  "tpope/vim-rails",

  -- testing
  {
    'vim-test/vim-test',
    config = function()
      vim.api.nvim_set_var('test#strategy', 'neovim')
    end
  },

  -- writing, notes and things
  "preservim/vim-markdown",
  "vim-pandoc/vim-pandoc",

  {
    "vim-pandoc/vim-pandoc-syntax",
    dependencies = {
      { "vim-pandoc/vim-pandoc" }
    }
  },

  -- play nice with others
  'editorconfig/editorconfig-vim',

  -- performance
  "nathom/filetype.nvim",
}
