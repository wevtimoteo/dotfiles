return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          mode = "tabs",
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_tab_indicators = true,
          enforce_regular_tabs = true,
          separator_style = "slant",
          numbers = "none",
          truncate_names = false,
          diagnostics = "nvim_lsp",
          color_icons = true,
          always_show_bufferline = true,
          hover = {
            enabled = false,
          },
        },
      })
    end,
  },
  {
    "HampusHauffman/block.nvim",
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
}
