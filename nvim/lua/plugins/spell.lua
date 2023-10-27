return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        ["*"] = { "codespell" },
      },
      linters = {
        codespell = {
          cmd = "codespell",
          args = { "--ignore-words", "~/.config/codespell/ignore-words.txt" },
        },
      },
    },
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      buffers = {
        set_filetype = true,
      },
    },
  },
}
