-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.cmd([[
  au BufRead,BufNewFile Podfile set filetype=ruby
  au BufRead,BufNewFile Guardfile set filetype=ruby
  au BufRead,BufNewFile Berksfile set filetype=ruby
  au BufRead,BufNewFile *.hamlc set filetype=haml
  au BufRead,BufNewFile *.ejs set filetype=html
  au BufRead,BufNewFile .env.example set filetype=sh
  au BufRead,BufNewFile .env.development set filetype=sh
  au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eex
  au BufRead,BufNewFile *.html.eex set filetype=heex
  au BufRead,BufNewFile mix.lock set filetype=elixir

  " Abbreviations
  ab pryb require 'pry';binding.pry
  ab pryi require IEx; IEx.pry
]])
