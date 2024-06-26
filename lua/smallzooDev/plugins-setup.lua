-- 여기서 저장을 해주면 packer가 자동으로 실행됨
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
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

  use("christoomey/vim-tmux-navigator")

  use("arcticicestudio/nord-vim") -- preferred colorscheme

  use("szw/vim-maximizer")

  use("goolord/alpha-nvim")

  use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  -- ys + character + quotes / ex -> ys + w + "
  -- ds + character + quotes 
  -- cs + character + former quotes + next quotes

  use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

  -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  use("nvim-tree/nvim-web-devicons")

   -- statusline
  use("nvim-lualine/lualine.nvim")


  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

  -- autocompletion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for text in buffer
  use("hrsh7th/cmp-path") -- source for file system paths

  -- snippets
  use("L3MON4D3/LuaSnip") -- snippet engine
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  use("rafamadriz/friendly-snippets") -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
  use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  use("neovim/nvim-lspconfig") -- easily configure language servers
  use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    requires = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  }) -- enhanced lsp uis
  use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
  use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

  -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

  -- nvim copilot
  use("github/copilot.vim")

  -- treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  })

  -- auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  -- git integration
  use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side


  use({
        "vimwiki/vimwiki",
        config = function()
          vim.g.vimwiki_conceallevel = 0
          vim.g.vimwiki_global_ext = 0
          vim.g.vimwiki_key_mappings = {
                table_mappings = 0,
            }
          vim.keymap.set('n', '<leader>nl', '<Plug>VimwikiNextLink', { silent = true }) -- For Tab
          vim.keymap.set('n', '<leader>pl', '<Plug>VimwikiPrevLink', { silent = true }) -- For STab
          vim.g.vimwiki_list = {
            {
              path = '/Users/joonkyu_kang/wiki/SmallzooDevWiki/content/_wiki',
              ext  = '.md',
              styntax = 'markdown',
              index = 'home'
            },
            {
              path = '/Users/joonkyu_kang/wiki/private_wiki',
              ext  = '.md',
            },
        }
      end
    })


  if packer_bootstrap then
    require("packer").sync()
  end
end)
