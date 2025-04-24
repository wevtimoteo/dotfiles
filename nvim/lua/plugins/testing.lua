return {
  {
    "nvim-neotest/neotest",
    lazy = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- adapters
      "jfpedroza/neotest-elixir",
      "olimorris/neotest-rspec",
      "zidhuss/neotest-minitest",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-rspec"),
          require("neotest-minitest"),
          require("neotest-elixir"),
        },
        output_panel = {
          enabled = true,
          open = "botright split | resize 15",
        },
        quickfix = {
          open = false,
        },
      }
    end,
    config = function(_, opts)
      require("neotest").setup(opts)
    end,
    keys = {
      {
        "<Leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Nearest test",
      },
      {
        "<Leader>tt",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Last test",
      },
      {
        "<Leader>tf",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Entire file",
      },
      {
        "<Leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Summary",
      },
      {
        "<Leader>te",
        function()
          require("neotest").output.open({ enter = true, auto_close = true })
        end,
        desc = "Expand error",
      },
    },
  },
}
