return {
   {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "MunifTanjim/nui.nvim",
         "nvim-tree/nvim-web-devicons",
      },
      lazy = false,
      opts = {
         window = {
            mappings = {
               ["<space>"] = { "toggle_node", nowait = false },
               ["<cr>"] = "open",
               ["l"] = "open",
               ["h"] = "close_node",
               ["v"] = "open_vsplit",
               ["s"] = "open_split",
               ["t"] = "open_tabnew",
               ["C"] = "close_all_nodes",
               ["z"] = "expand_all_nodes",
               ["a"] = { "add", config = { show_path = "relative" } },
               ["A"] = "add_directory",
               ["d"] = "delete",
               ["r"] = "rename",
               ["y"] = "copy_to_clipboard",
               ["x"] = "cut_to_clipboard",
               ["p"] = "paste_from_clipboard",
               ["c"] = "copy",
               ["m"] = "move",
               ["q"] = "close_window",
               ["R"] = "refresh",
               ["?"] = "show_help",
               ["<"] = "prev_source",
               [">"] = "next_source",
               ["i"] = "show_file_details",
               ["P"] = { "toggle_preview", config = { use_float = true } },
            },
         },
      },
   },
   {
      "Crysthamus/nvim-file-operations",
      -- branch = "compat" -- if you are on Neovim <= 0.10
      dependencies = {
         "nvim-neo-tree/neo-tree.nvim",
      },
      opts = {},
   },
   {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      opts = {
         filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            bo = {
               filetype = { "neo-tree", "neo-tree-popup", "notify" },
               buftype = { "terminal", "quickfix" },
            },
         },
      },
   },
}
