return {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = false,
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "scss",
      })
    end,
  },
}
