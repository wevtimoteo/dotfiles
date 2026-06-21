return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = {
            ".git",
            "log",
            "tmp",
            "**/public/assets",
            "**/public/packs",
            "**/public/packs-test",
            "build",
            "./priv",
            "vendor",
            "**/node_modules",
            "**/deps",
            "coverage",
          },
        },
      },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
            n = {
              ["<c-t>"] = require("telescope.actions").select_tab,
            },
          },
        },
      })
    end,
  },
  {
    "folke/flash.nvim",
    enabled = false,
    setup = function()
      local flash = require("flash")

      local function overrideCharSetup()
        flash.Repeat.setup()

        -- Override keys list (to remove `;`, since I'm using it on normal mode)
        local keys = { "f", "F", "t", "T", "," }

        for _, key in ipairs(keys) do
          vim.keymap.set({ "n", "x", "o" }, key, function()
            if flash.Repeat.is_repeat then
              flash.Char.jumping = true
              flash.Char.state:jump({ count = vim.v.count1 })
              flash.Char.state:show()
              vim.schedule(function()
                flash.Char.jumping = false
              end)
            else
              flash.Char.jump(key)
            end
          end, {
            silent = true,
          })
        end

        vim.api.nvim_create_autocmd({ "BufLeave", "CursorMoved", "InsertEnter", "TextYankPost" }, {
          group = vim.api.nvim_create_augroup("flash_char", { clear = true }),
          callback = function(event)
            local hide = event.event == "InsertEnter"
              or (event.event == "TextYankPost" and vim.v.operator == "y")
              or not flash.Char.jumping
            if hide and flash.Char.state then
              flash.Char.state:hide()
            end
          end,
        })

        vim.on_key(function(key)
          if flash.Char.state and key == flash.Util.ESC and vim.fn.mode() == "n" then
            flash.Char.state:hide()
          end
        end)
      end

      -- Override Char.setup with the new function
      flash.Char.setup = overrideCharSetup
    end,
  },
  {
    "MagicDuck/grug-far.nvim",
    opts = { open_cmd = "noswapfile vnew" },
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("grug-far").open() end, desc = "Replace in files (Grug)" },
    },
  },
  {
    "ibhagwan/fzf-lua", -- Fuzzy finder
    opts = function(_, opts)
      local fzf = require("fzf-lua")
      local config = fzf.config
      local actions = fzf.actions

      config.defaults.actions.files["ctrl-t"] = actions.file_tabedit
    end,
  },
}
