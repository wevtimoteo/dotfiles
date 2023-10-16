return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      copilot_node_command = vim.g.neovim_node_host_prog,
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },
}
