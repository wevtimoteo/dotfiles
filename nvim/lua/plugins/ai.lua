return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    init = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "ollama",
          },
          inline = {
            adapter = "ollama",
          },
        },
        adapters = {
          ollama = function()
            return require("codecompanion.adapters").extend("ollama", {
              schema = {
                model = {
                  default = "deepseek-coder:6.7b",
                },
              },
            })
          end,
        },
      })
    end,
    config = function()
      -- Expand `cc` into CodeCompanion in the command line
      vim.cmd([[cab cc CodeCompanion]])
    end,
    keys = {
      {
        "<leader>ic",
        "<cmd>CodeCompanionChat<CR>",
        desc = "A[I] [C]hat",
        mode = { "n", "v" },
      },
      {
        "<leader>ia",
        "<cmd>CodeCompanion<CR>",
        desc = "A[I] [A]sk",
        mode = { "n", "v" },
      },
      {
        "<leader>il",
        "<cmd>CodeCompanionActions<CR>",
        desc = "A[I] [L]ist of actions",
        mode = { "n", "v" },
      },
    },
  },
}
