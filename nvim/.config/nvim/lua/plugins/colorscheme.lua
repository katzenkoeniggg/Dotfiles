return {
   {
      "rebelot/kanagawa.nvim",
      lazy = true,
      opts = {
         transparent = true,
      },
   },
   {
      "Everblush/nvim",
      name = "everblush",
      lazy = true,
      opts = {
         transparent_background = true,
      },
   },
   {
      "scottmckendry/cyberdream.nvim",
      lazy = true,
      opts = {
         transparent = true,
      },
   },
   {
      "navarasu/onedark.nvim",
      lazy = true,
      opts = {
         style = "darker",
         transparent = true,
      },
   },
   {
      "ankushbhagats/pastel.nvim",
      lazy = true,
      opts = {
         style = {
            transparent = true,
            dynamic_statusline = true,
         },
      },
      config = true,
   },
   {
      "lancewilhelm/horizon-extended.nvim",
      lazy = true,
      opts = {
         transparent = true,
      },
   },
   {
      "Shatur/neovim-ayu",
      lazy = true,
      opts = {
         overrides = {
            Normal = { bg = "None" },
            NormalFloat = { bg = "none" },
            ColorColumn = { bg = "None" },
            SignColumn = { bg = "None" },
            Folded = { bg = "None" },
            FoldColumn = { bg = "None" },
            -- CursorLine = { bg = "None" },
            CursorColumn = { bg = "None" },
            VertSplit = { bg = "None" },
         },
      },
      config = function(_, opts)
         require("ayu").setup(opts)
      end,
   },
   {
      "catppuccin/nvim",
      lazy = true,
      opts = {
         transparent_background = true,
      },
   },
   {
      "ellisonleao/gruvbox.nvim",
      lazy = true,
      opts = {
         contrast = "hard", -- "hard", "soft", or "" (medium)
         transparent_mode = true,
      },
   },
   {
      "folke/tokyonight.nvim",
      lazy = true, -- make sure we load this during startup if it is your main colorscheme
      opts = {
         transparent = true,
      },
   },
   {
      "AvengeMedia/base46",
      lazy = true,
      opts = {
         hl_override = {
            CursorLine = {
               bg = "one_bg",
            },
         },
         transparency = true,
      },
   },

   {
      "rebelot/kanagawa.nvim",
      lazy = false,
      priority = 1000,
      config = function()
         local ok, lines = pcall(vim.fn.readfile, vim.fn.stdpath("data") .. "/last_colorscheme")
         vim.cmd.colorscheme(ok and lines[1] or "kanagawa")
      end,
   },
}
