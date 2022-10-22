local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- simplify calling config/foo
-- with get_config("foo")
function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  })
  execute "packadd packer.nvim"
end

-- regenerate compiled loader file anytime changes are
-- made to this file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

local packer = require("packer")
packer.init {
  enabled = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0,  -- only include plugins that take longer than this, in ms
}

local use = packer.use
packer.reset()

-- the plugins

use 'wbthomason/packer.nvim'

use({ 'nvim-lua/plenary.nvim', module = 'plenary' })
use({ 'nvim-lua/popup.nvim', module = 'popup' })

-- find all the things
use({
  "junegunn/fzf",
  requires = {
    { "junegunn/fzf.vim" }
  },
})

use({ "jremmen/vim-ripgrep" })

use({
  'nvim-telescope/telescope.nvim',
  requires = {
    { 'nvim-lua/popup.nvim' },
    { 'nvim-lua/plenary.nvim' },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },
  config = get_config("telescope")
})

use({ 'nvim-telescope/telescope-fzy-native.nvim' })

use({
  "cuducos/yaml.nvim",
  ft = { "yaml" },
  requires = {
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-telescope/telescope.nvim" },
  },
})

-- quality of life things
use 'tpope/vim-surround'
use 'mechatroner/rainbow_csv'

use {
  "mhartington/formatter.nvim",
  config = get_config("formatter"),
}
use 'sbdchd/neoformat'

-- use {
--   "ggandor/leap.nvim",
--   config = get_config("leap"),
-- }
use ({"ggandor/leap.nvim"})

use { "mbbill/undotree" }

-- treesitter and friends
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = get_config("treesitter"),
}
use 'slim-template/vim-slim'

-- git
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = get_config("gitsigns"),
  event = "BufEnter",
}

use {
  'TimUntersberger/neogit',
  cmd = 'Neogit',
  config = get_config("neogit"),
}

-- lsp and things
use({
  'neovim/nvim-lspconfig',
  config = get_config("lspconfig"),
})

use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    cmd = {"TroubleToggle", "Trouble"},
    config = get_config("trouble")
}

use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = {"TodoTrouble", "TodoTelescope"},
    event = "BufReadPost",
    config = get_config("todo")
}

use {
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPre",
  config = get_config("colorizer"),
}

-- completion
use {
  "hrsh7th/nvim-cmp",
  requires = {
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"},
    {"hrsh7th/cmp-vsnip"},
    {"f3fora/cmp-spell"},
    {"hrsh7th/cmp-calc"},
    {"hrsh7th/cmp-emoji"},
  },
  config = get_config("nvim-cmp"),
}

use {
  'onsails/lspkind-nvim',
  config = get_config("lspkind"),
}

-- rails
use { "tpope/vim-rails" }

-- snippets
use {"hrsh7th/vim-vsnip", config = get_config("vsnip")}
use {"hrsh7th/vim-vsnip-integ", requires = {{"hrsh7th/vim-vsnip"}}}
use {"rafamadriz/friendly-snippets", requires = {{"hrsh7th/vim-vsnip"}}}

-- status line
use({
  'nvim-lualine/lualine.nvim',
  config = get_config("lualine"),
  event = "VimEnter",
  requires = { 'kyazdani42/nvim-web-devicons', opt = true },
})

-- keymappings
use {
  "folke/which-key.nvim",
  config = get_config("which-key")
}

-- writing, notes and things
use {
  "vimwiki/vimwiki",
  config = get_config("vimwiki")
}

use {
  "nvim-orgmode/orgmode",
  config = get_config("orgmode")
}

-- play nice with others
use 'editorconfig/editorconfig-vim'

-- performance
use "nathom/filetype.nvim"

-- colors
use({"navarasu/onedark.nvim"})
use({"arcticicestudio/nord-vim"})
use({"rakr/vim-one"})
use({"sainnhe/sonokai"})
