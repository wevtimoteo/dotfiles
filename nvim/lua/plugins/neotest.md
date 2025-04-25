# Neotest overwrite configs

- Turn on `exrc` option

```lua
vim.opt.exrc = true
```

- Create `.nvim.lua` file at the project root directory

## Docker configs

```lua
if not pcall(require, "neotest") then
  return
end

vim.schedule(function()
  require("neotest").setup_project(vim.loop.cwd(), {
    adapters = {
      require("neotest-rspec")({
        rspec_cmd = function()
          return vim.tbl_flatten({
            "docker",
            "compose",
            "exec",
            "web",
            "bin/rspec",
          })
        end,
        transform_spec_path = function(path)
          local prefix = require("neotest-rspec").root(path)
          return string.sub(path, string.len(prefix) + 2, -1)
        end,
        results_path = "tmp/rspec.output",
        formatter = "json",
      }),
      require("neotest-minitest")({
        test_cmd = function()
          return vim.tbl_flatten({
            "docker",
            "compose",
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
      }),
    },
  })
end)
```
