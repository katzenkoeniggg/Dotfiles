return {
   "mikavilpas/yazi.nvim",
   version = "*", -- use the latest stable version
   event = "VeryLazy",
   dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
   },

   opts = {
      integrations = {
         grep_in_directory = "fzf-lua",
         grep_in_selected_files = "fzf-lua",
      },
      open_for_directories = false,
      floating_window_scaling_factor = 0.7,
      keymaps = {
         show_help = "<f1>",
      },
   },

   keys = {
      {
         "<leader>z",
         mode = { "n", "v" },
         "<cmd>Yazi<cr>",
         desc = "Open yazi at the current file",
      },
      {
         "<leader>Z",
         "<cmd>Yazi cwd<cr>",
         desc = "Open the file manager in nvim's working directory",
      },
      {
         "<c-z>",
         "<cmd>Yazi toggle<cr>",
         desc = "Resume the last yazi session",
      },
   },

   -- 👇 if you use `open_for_directories=true`, this is recommended
   init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
   end,
}
