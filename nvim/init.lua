local node_version = vim.fn.systemlist("asdf list nodejs | tail -1")[1]
node_version = string.gsub(node_version, "*", "") -- Remove leading *

vim.g.neovim_node_host_prog = vim.fn.trim(vim.fn.system("asdf where nodejs " .. node_version))

-- Loads LazyVim
require("config.lazy")
