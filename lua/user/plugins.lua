local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs"
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"

  -- Commenting
  use "tpope/vim-commentary" -- Commenting

  -- Indentation
  use "lukas-reineke/indent-blankline.nvim" -- Indentation:

  -- Scrolling
  use "karb94/neoscroll.nvim" -- Smooth scrolling

  -- Session Management
  use "rmagatti/auto-session"
  use "rmagatti/session-lens"

  -- Status bars
  use "akinsho/bufferline.nvim"
  use 'feline-nvim/feline.nvim'

  -- Surround
  use "kylechui/nvim-surround"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "sainnhe/everforest"

  -- completion plugins
  use ({"hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "onsails/lspkind-nvim",
    }
  })

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "rafamadriz/friendly-snippets"
  use "andy-blum/smart-drupal-snippets"
  use "rrethy/vim-illuminate"

  --fonts
  use "ryanoasis/vim-devicons"
  
  -- Telescope
  use { "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    }
  }

  -- LSP
  use ({ "neovim/nvim-lspconfig",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jayp0521/mason-null-ls.nvim",
    }
  })
  use "folke/trouble.nvim"

  -- DAP
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'

  -- Tests
  use "vim-test/vim-test"

  -- Treesitter
  use { 
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "joosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
      "mrjones2014/nvim-ts-rainbow",
    }
  }
  use "p00f/nvim-ts-rainbow"

  -- Gihub copilot
  use "github/copilot.vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
