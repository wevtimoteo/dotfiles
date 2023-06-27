return {
  {
    "nvim-telescope/telescope.nvim",
    require("telescope").setup({
      defaults = {
        mappings = {
          n = {
            ["<c-t>"] = require("telescope.actions").select_default,
          },
        },
      },
    }),
  },
  {
    "folke/flash.nvim",
    config = function()
      local flash = require("flash")

      flash.setup = function()
        -- Removes `;` from default setup function
        for _, key in ipairs({ "f", "F", "t", "T", "," }) do
          if vim.tbl_contains(Config.modes.char.keys, key) then
            vim.keymap.set({ "n", "x", "o" }, key, function()
              if Repeat.is_repeat then
                M.jumping = true
                M.state:jump({ count = vim.v.count1 })
                M.state:show()
                vim.schedule(function()
                  M.jumping = false
                end)
              else
                M.jump(key)
              end
            end, {
              silent = true,
            })
          end
        end
      end
    end,
  },
  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
}
