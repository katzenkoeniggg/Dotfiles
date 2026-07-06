return {
   "AvengeMedia/base46",
   lazy = false,
   priority = 1000,
   opts = {
      hl_override = {
         CursorLine = {
            bg = "one_bg",
         },
      },
      transparency = true,
   },
   config = function(_, opts)
      require("base46").setup(opts)
      vim.cmd.colorscheme("base46-dark_horizon")
   end,
}
