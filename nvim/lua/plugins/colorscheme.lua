return {
  {
    "maxmx03/fluoromachine.nvim",
    config = function()
      local fm = require("fluoromachine")

      fm.setup({
        glow = true,
        theme = "delta",
        brightness = 0.07,
      })

      vim.cmd.colorscheme("fluoromachine")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
  },
}
