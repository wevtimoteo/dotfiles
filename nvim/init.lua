local node_bin_path = vim.fn.trim(vim.fn.system("which node ")) .. "/bin"
vim.g.neovim_node_host_prog = node_bin_path .. "/node"

-- Loads LazyVim
require("config.lazy")
