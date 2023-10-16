return {
  {
    "maxmx03/fluoromachine.nvim",
    enabled = false,
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
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      integrations = {
        alpha = true,
        cmp = true,
        flash = true,
        gitsigns = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        lsp_trouble = true,
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        noice = true,
        notify = true,
        neotree = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        which_key = true,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
}
