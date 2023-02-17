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

  use("nvim-lualine/lualine.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
