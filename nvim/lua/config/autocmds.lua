-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- FormatHTML through tidy-html5
function FormatHTML()
  local orig_pos = vim.fn.getpos(".")
  local buf_content = vim.fn.getline(1, "$")
  local formatted_content = vim.fn.systemlist("tidy -q -i -w 0", buf_content)
  vim.fn.setline(1, formatted_content)
  vim.fn.setpos(".", orig_pos)
end

vim.cmd([[
  au BufRead,BufNewFile Podfile set filetype=ruby
  au BufRead,BufNewFile Guardfile set filetype=ruby
  au BufRead,BufNewFile Berksfile set filetype=ruby
  au BufRead,BufNewFile *.hamlc set filetype=haml
  au BufRead,BufNewFile *.ejs set filetype=html
  au BufRead,BufNewFile .env.example set filetype=sh
  au BufRead,BufNewFile .env.development set filetype=sh
  au BufRead,BufNewFile *.pcss set filetype=scss

  " Abbreviations
  ab pryb require 'pry';binding.pry
  ab pryi require IEx; IEx.pry
]])

-- Disables resize_splits autocmds that causes last tab being focused on window resized
vim.api.nvim_del_augroup_by_name("lazyvim_resize_splits")

local group = vim.api.nvim_create_augroup("Elixir", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*.ex,*.exs",
  group = group,
  callback = function()
    local ok, otter = pcall(require, "otter")
    if ok then
      otter.activate({ "markdown" })
    end
  end,
})
