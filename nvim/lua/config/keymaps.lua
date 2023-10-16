-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local set_keymap = vim.api.nvim_set_keymap

-- Helper function to set key mappings for multiple modes
local function multiple_set_keymap(modes, lhs, rhs, opts)
  for mode in string.gmatch(modes, "%a") do
    set_keymap(mode, lhs, rhs, opts)
  end
end

-- explore
set_keymap("n", "<leader>e", ":Exp<cr>", { desc = "Enter netrw" })

-- navigation
set_keymap("n", "<C-j>", "5j", { desc = "Jump down" })
set_keymap("n", "<C-k>", "5k", { desc = "Jump up" })
set_keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
set_keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

-- tabs
set_keymap("n", "<leader>tc", ":tabclose<cr>", { desc = "Close tab" })

-- commands
set_keymap("n", ";", ":", { desc = "Fast command" })

set_keymap("c", "<C-e>", "<C-r>=expand('%:p:h')<CR>/", { desc = "Fill current dir" })

-- replace
set_keymap("n", "<leader>:", ":%s/:(w+)(s*=>s*)/\1: /gc<CR>", { desc = "Replace old Ruby hash syntax to new one" })

-- Set the key mapping for <Up> to increment cursor number
set_keymap("n", "<Up>", "<C-a>", {
  desc = "Increment cursor number",
  noremap = true,
})

-- Set the key mapping for <Down> to decrement cursor number
set_keymap("n", "<Down>", "<C-x>", {
  desc = "Decrement cursor number",
  noremap = true,
})

-- Disable arrow keys in normal mode
multiple_set_keymap("n,i", "<Left>", "<Nop>", { noremap = true, silent = true })
multiple_set_keymap("n,i", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in insert mode
set_keymap("i", "<Up>", "<Nop>", { noremap = true, silent = true })
set_keymap("i", "<Down>", "<Nop>", { noremap = true, silent = true })

local is_maximized = false

vim.toggle_maximize_window = function()
  if is_maximized then
    vim.cmd("wincmd =")
    is_maximized = false
  else
    vim.cmd("wincmd |")
    vim.cmd("wincmd _")
    is_maximized = true
  end
end

set_keymap("n", "<Leader>z", ":lua vim.toggle_maximize_window()<CR>", { desc = "Toggle maximize window" })
