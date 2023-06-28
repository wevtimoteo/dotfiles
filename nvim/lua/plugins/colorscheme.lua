return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")

      local custom_theme = {
        fg = "#7C0097",
        bg = "#FAE5FF",
      }

      -- Reverse the colors
      local custom_title_theme = {
        bg = custom_theme.fg,
        fg = custom_theme.bg,
      }

      fm.setup({
        glow = true,
        theme = "delta",
        brightness = 0.05,
        overrides = {
          TelescopePromptTitle = custom_title_theme,
          TelescopePreviewTitle = custom_title_theme,
          TelescopeResultsTitle = custom_title_theme,
          TelescopeResultsBorder = custom_theme,
          TelescopeResultsNormal = custom_theme,
          TelescopeMatching = {
            bg = "#FF6596",
            fg = custom_title_theme.fg,
          },
        },
      })

      fm.colors.selection = "#7d229c"

      vim.cmd.colorscheme("fluoromachine")

      local lualine = require("lualine")

      lualine.setup({
        options = {
          theme = "fluoromachine",
        },
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
}
