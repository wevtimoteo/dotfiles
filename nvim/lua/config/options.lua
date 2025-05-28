-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Read initialization commands from ".nvim.lua",
-- ".nvimrc", or ".exrc" in current directory.
opt.exrc = true

opt.relativenumber = false
opt.spelllang = { "en" }
opt.clipboard = ""
