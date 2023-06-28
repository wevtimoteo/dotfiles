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

-- alias for leader
set_keymap("n", "<space>", "<leader>", { desc = "Alias for leader", silent = true })

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

-- select
--set_keymap("n", "<CR>", "<Plug>(textobj-punctuation-i)", { desc = "Select content inside punctuation", silent = false })

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
set_keymap("n", "<Left>", "<Nop>", { noremap = true, silent = true })
set_keymap("n", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Disable arrow keys in insert mode
set_keymap("i", "<Up>", "<Nop>", { noremap = true, silent = true })
set_keymap("i", "<Down>", "<Nop>", { noremap = true, silent = true })
set_keymap("i", "<Left>", "<Nop>", { noremap = true, silent = true })
set_keymap("i", "<Right>", "<Nop>", { noremap = true, silent = true })

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

-- Call Telescope file finder directly with <Ctrl+p> in normal and insert modes
multiple_set_keymap("n,i", "<C-p>", "<Cmd>Telescope find_files<CR>", {
  noremap = true, -- Do not remap nested mappings
  silent = true, -- Do not show the mapping in command-line area
  desc = "Find files", -- Description for the key mapping
})
