return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")

      local custom_theme = {
        default = {
          fg = "#7C0097",
          bg = "#FAE5FF",
        },
        title = {
          fg = "#FAE5FF",
          bg = "#7C0097",
        },
        match = {
          fg = "#DCAAFF",
          bg = "#7B439C",
        },
        search = {
          fg = "#EED1FF",
          bg = "#9C429A",
        },
        selection = {
          fg = "#EED1FF",
          bg = "#6E3273",
        },
      }

      fm.setup({
        glow = true,
        theme = "delta",
        brightness = 0.07,
        overrides = {
          TelescopePromptTitle = custom_theme.title,
          TelescopePreviewTitle = custom_theme.title,
          TelescopeResultsTitle = custom_theme.title,
          TelescopeResultsBorder = custom_theme.default,
          TelescopeResultsNormal = custom_theme.default,
          TelescopeMatching = custom_theme.match,
          TelescopeSelection = custom_theme.selection,
          Search = custom_theme.search,
          Visual = custom_theme.selection,
          illuminatedWord = custom_theme.match,
          illuminatedCurWord = custom_theme.search,
          CmpItemAbbrMatch = custom_theme.match,
          CmpItemAbbrMatchFuzzy = custom_theme.match,
        },
      })

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
