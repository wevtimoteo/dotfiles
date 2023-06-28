return {
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      local highlight_colors = require("nvim-highlight-colors")
      highlight_colors.turnOn()
    end,
  },
}
