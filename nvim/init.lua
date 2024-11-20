local node_version = vim.fn.systemlist("asdf list nodejs | tail -1")[1]
node_version = string.gsub(node_version, "*", "") -- Remove leading *

local node_bin_path = vim.fn.trim(vim.fn.system("asdf where nodejs " .. node_version)) .. "/bin"
vim.g.neovim_node_host_prog = node_bin_path .. "/node"

-- Loads LazyVim
require("config.lazy")
