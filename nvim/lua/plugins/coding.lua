return {
  {
    "RRethy/nvim-treesitter-endwise", -- Wisely add "end" in Ruby
    enabled = false,
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        endwise = {
          enable = true,
        },
      })
    end,
  },
  {
    "sustech-data/wildfire.nvim", -- Smart selection of the closest text object (<CR> expands, <BS> shrinks)
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      surrounds = {
        { "(", ")" },
        { "{", "}" },
        { "<", ">" },
        { "[", "]" },
        { '"', '"' },
        { "'", "'" },
      },
      keymaps = {
        init_selection = "<CR>",
        node_incremental = "<CR>",
        node_decremental = "<BS>",
      },
      filetype_exclude = { "qf", "markdown" },
    },
    init = function()
      -- Markdown is excluded above because treesitter parses [text](url) as one
      -- inline node, so <CR> would select the whole line. Map <CR> to select
      -- inside the closest enclosing bracket pair using native vim text objects.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          vim.keymap.set("n", "<CR>", function()
            local pairs = { { "(", ")" }, { "[", "]" }, { "{", "}" } }
            local best, best_lnum, best_col = nil, 0, 0
            for _, p in ipairs(pairs) do
              local lnum, col = unpack(vim.fn.searchpairpos([[\V]] .. p[1], "", [[\V]] .. p[2], "bnW"))
              if lnum > 0 and (lnum > best_lnum or (lnum == best_lnum and col > best_col)) then
                best, best_lnum, best_col = p[1], lnum, col
              end
            end
            if best then
              vim.cmd("normal! vi" .. best)
            end
          end, { buffer = args.buf, desc = "Select inside closest bracket pair" })
        end,
      })
    end,
  },
  {
    "nvim-mini/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "Wansmer/symbol-usage.nvim", -- Display references, definitions and implementations of document symbols
    event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      local function h(name)
        return vim.api.nvim_get_hl(0, { name = name })
      end

      -- hl-groups can have any name
      vim.api.nvim_set_hl(0, "SymbolUsageRounding", { fg = h("CursorLine").bg, italic = true })
      vim.api.nvim_set_hl(0, "SymbolUsageContent", { bg = h("CursorLine").bg, fg = h("Comment").fg, italic = true })
      vim.api.nvim_set_hl(0, "SymbolUsageRef", { fg = h("Function").fg, bg = h("CursorLine").bg, italic = true })
      vim.api.nvim_set_hl(0, "SymbolUsageDef", { fg = h("Type").fg, bg = h("CursorLine").bg, italic = true })
      vim.api.nvim_set_hl(0, "SymbolUsageImpl", { fg = h("@keyword").fg, bg = h("CursorLine").bg, italic = true })

      local function text_format(symbol)
        local res = {}

        local round_start = { "", "SymbolUsageRounding" }
        local round_end = { "", "SymbolUsageRounding" }

        if symbol.references then
          local usage = symbol.references <= 1 and "usage" or "usages"
          local num = symbol.references == 0 and "no" or symbol.references
          table.insert(res, round_start)
          table.insert(res, { "󰌹 ", "SymbolUsageRef" })
          table.insert(res, { ("%s %s"):format(num, usage), "SymbolUsageContent" })
          table.insert(res, round_end)
        end

        if symbol.definition then
          if #res > 0 then
            table.insert(res, { " ", "NonText" })
          end
          table.insert(res, round_start)
          table.insert(res, { "󰳽 ", "SymbolUsageDef" })
          table.insert(res, { symbol.definition .. " defs", "SymbolUsageContent" })
          table.insert(res, round_end)
        end

        if symbol.implementation then
          if #res > 0 then
            table.insert(res, { " ", "NonText" })
          end
          table.insert(res, round_start)
          table.insert(res, { "󰡱 ", "SymbolUsageImpl" })
          table.insert(res, { symbol.implementation .. " impls", "SymbolUsageContent" })
          table.insert(res, round_end)
        end

        return res
      end

      require("symbol-usage").setup({
        text_format = text_format,
        request_pending_text = false,
        vt_position = "end_of_line",
        references = { enabled = true, include_declaration = true },
        definition = { enabled = true },

        filetypes = {
          elixir = {
            symbol_request_pos = "start",
          },
        },
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim", -- LSP experience improved
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      --"nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "stevearc/conform.nvim", -- formatter
    opts = {
      default_format = {
        async = true,
      },
    },
  },
  {
    "cappyzawa/trim.nvim",
    opts = {},
  },
}
