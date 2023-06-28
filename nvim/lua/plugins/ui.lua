return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      local highlight_colors = require("nvim-highlight-colors")

      highlight_colors.turnOn()

      highlight_colors.setup({
        render = "background",
        enable_named_colors = true,
        enable_tailwind = true,
      })
    end,
  },
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
}
