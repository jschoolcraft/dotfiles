return require('packer').startup(function()
  -- Package manager itself.
  use 'wbthomason/packer.nvim'

  use({ 'nvim-lua/plenary.nvim', module = 'plenary' })
  use({ 'nvim-lua/popup.nvim', module = 'popup' })

  -- find all the things
  use({
    'nvim-telescope/telescope.nvim',
    opt = true,
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    cmd = 'Telescope',
    config = function()
      require('plugins/config/telescope')
    end,
  })

  use({ 'nvim-telescope/telescope-fzy-native.nvim' })

  use({ 'jremmen/vim-ripgrep' })

  -- quality of life things
  use 'tpope/vim-surround'

  -- treesitter and friends
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('plugins/config/treesitter')
    end,
  })
  use 'slim-template/vim-slim'


  -- git
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('plugins/config/gitsigns')
    end,
  }

  -- lsp and things
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins/config/lspconfig')
    end,
  })

  use({
    'glepnir/lspsaga.nvim',
    config = function()
      require('plugins/config/lspconfig')
    end,
  })

  use({
    'kabouzeid/nvim-lspinstall',
    requires = { 'neovim/nvim-lspconfig' },
    config = function()
      require('lspinstall').setup()
    end,
  })

  -- completion
  use({
    'hrsh7th/nvim-cmp',
    after = { 'nvim-lspconfig' },
    requires = {
      { 'kabouzeid/nvim-lspinstall' },
      {
        'hrsh7th/cmp-nvim-lua',
        after = 'nvim-cmp',
      },
      {
        'hrsh7th/cmp-nvim-lsp',
        after = 'nvim-cmp',
        config = function()
          require('cmp_nvim_lsp').setup({})
        end,
      },
      -- { 'L3MON4D3/LuaSnip' },
      -- { 'saadparwaiz1/cmp_luasnip' },
      -- {
      --   'hrsh7th/cmp-vsnip',
      --   after = 'nvim-cmp',
      --   requires = {
      --     'hrsh7th/vim-vsnip',
      --     'rafamadriz/friendly-snippets',
      --   },
      -- },
      {
        'hrsh7th/cmp-buffer',
        after = 'nvim-cmp',
      },
      {
        'hrsh7th/cmp-calc',
        after = 'nvim-cmp',
      },
      {
        'hrsh7th/cmp-path',
        after = 'nvim-cmp',
      },
    },
    config = function()
      require('plugins/config/nvim-cmp')
    end,
  })

  use({
    'onsails/lspkind-nvim',
    config = function()
      require('plugins/config/lspkind')
    end,
  })

  -- status line
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup({
        options = {
          theme = 'onedark'
        }
      })
    end,
  })

  -- keymappings
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- play nice with others
  use 'editorconfig/editorconfig-vim'

  -- colors
  use 'ful1e5/onedark.nvim'
  use 'arcticicestudio/nord-vim'
  use 'jsahlen/vim-ir_black'
  use 'rakr/vim-one'
  use 'sainnhe/sonokai'
end)
