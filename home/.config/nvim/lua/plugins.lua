local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
print("install_path: " .. install_path)

-- simplify calling config/foo
-- with get_config("foo")
function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

-- bootstrap packer if not installed
-- "bootstrap" seems ambitious
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
  'nvim-telescope/telescope.nvim',
  requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
  config = get_config("telescope")
})

use({ 'nvim-telescope/telescope-fzy-native.nvim' })

use({ 'jremmen/vim-ripgrep' })

-- quality of life things
use 'tpope/vim-surround'

use {
  "phaazon/hop.nvim",
  event = "BufReadPre",
  config = get_config("hop"),
}

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
}

-- lsp and things
use({
  'neovim/nvim-lspconfig',
  config = get_config("lspconfig"),
})

-- use({
--   'glepnir/lspsaga.nvim',
--   config = get_config("lspsaga"),
-- })

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

--[[
use({
  'kabouzeid/nvim-lspinstall',
  requires = { 'neovim/nvim-lspconfig' },
  config = function()
    require('lspinstall').setup()
  end,
})
]]--

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

-- snippets
use {"hrsh7th/vim-vsnip", config = get_config("vsnip")}
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

-- play nice with others
use 'editorconfig/editorconfig-vim'

-- colors
use 'ful1e5/onedark.nvim'
use 'arcticicestudio/nord-vim'
use 'jsahlen/vim-ir_black'
use 'rakr/vim-one'
use 'sainnhe/sonokai'
