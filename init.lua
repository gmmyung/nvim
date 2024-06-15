local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set <space> as leader key
-- This MUST happen before plugins are required.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Import lazy plugins
-- Each config is stored in "lua/plugins/<plugin_name>.lua"
require("lazy").setup('plugins')

-- NeoVim core configuration
require("core")
