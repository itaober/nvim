-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- Colorschemes
  use { "ellisonleao/gruvbox.nvim" }

  -- essential plugins
  use "windwp/nvim-autopairs"
  use "tpope/vim-surround"

  -- connenting with gc
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- file explorer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    tag = "nightly" -- optional, updated every week. (see issue #1193)
  }

  -- statusline
  use "nvim-lualine/lualine.nvim"

  -- fuzzy finding
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- autocompletion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"

  -- snippets
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"

  -- managing & installing lsp servers
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- configuring lsp servers
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"
  use { "glepnir/lspsaga.nvim", branch = "main" }
  use "jose-elias-alvarez/typescript.nvim"
  use "onsails/lspkind.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
