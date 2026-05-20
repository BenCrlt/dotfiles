return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "StatusLine",
        "StatusLineNC",
        "WinSeparator",
        "LineNr",
        "CursorLineNr",
        "FoldColumn",
        "EndOfBuffer",
        "Pmenu",
      }

      local function clear_background()
        for _, group in ipairs(groups) do
          local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
          if ok then
            hl.bg = nil
            hl.ctermbg = nil
            vim.api.nvim_set_hl(0, group, hl)
          end
        end
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "catppuccin*",
        callback = clear_background,
      })

      vim.api.nvim_create_autocmd("VimEnter", {
        callback = clear_background,
      })
    end,
    opts = {
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        native_lsp = {
          enabled = true,
        },
        snacks = true,
        noice = true,
        mason = true,
      },
      custom_highlights = function()
        return {
          Normal = { bg = "NONE" },
          NormalNC = { bg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          SignColumn = { bg = "NONE" },
          StatusLine = { bg = "NONE" },
          StatusLineNC = { bg = "NONE" },
          WinSeparator = { bg = "NONE" },
        }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
