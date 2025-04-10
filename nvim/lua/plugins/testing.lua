return {
  {
    "nvim-neotest/neotest",
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
    opts = {
      log_level = vim.log.levels.DEBUG,
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      quickfix = {
        open = false,
      },
      adapters = {
        ["neotest-elixir"] = {
          mix_command = function()
            return "docker compose exec app mix"
          end,
        },
        ["neotest-rspec"] = {
          rspec_cmd = function()
            return vim.tbl_flatten({
              "docker-compose",
              "exec",
              "app",
              "bin/rspec",
            })
          end,
          transform_spec_path = function(path)
            local prefix = require("neotest-rspec").root(path)
            return string.sub(path, string.len(prefix) + 2, -1)
          end,
          results_path = "tmp/rspec.output",
          formatter = "json",
        },
        ["neotest-minitest"] = {
          test_cmd = function()
            return vim.tbl_flatten({
              "docker-compose",
              "exec",
              "web",
              "bin/rails",
              "test",
            })
          end,
          transform_spec_path = function(path)
            local prefix = require("neotest-minitest").root(path)
            return string.sub(path, string.len(prefix) + 2, -1)
          end,
        },
      },
    },
  },
}
