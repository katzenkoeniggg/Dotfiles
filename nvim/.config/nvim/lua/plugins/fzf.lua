return {
   "ibhagwan/fzf-lua",
   dependencies = { "nvim-tree/nvim-web-devicons" },

   ---@module "fzf-lua"
   ---@type fzf-lua.Config | { }
   ---@diagnostic disable: missing-fields

   opts = {
      ui_select = {
         winopts = {
            height = 0.6,
            width = 0.4,
            row = 0.3,       -- Vertical position (0 = top, 1 = bottom)
            col = 0.5,       -- Horizontal position (0 = left, 1 = right)
            border = "none", -- 'single', 'double', 'rounded', 'solid', 'shadow'
         },
      },
      fzf_colors = false,
      winopts = {
         border = "none",
         backdrop = 100,
         preview = {
            title_pos = "right",
            border = "rounded",
         },
      },
      fzf_opts = {
         ["--layout"] = "reverse-list",
      },
      files = {
         -- cmd = "rg --files",
      },
      undotree = { previewer = "undotree", locate = false },
      keymap = {
         fzf = {
            ["ctrl-d"] = "half-page-down",
            ["ctrl-u"] = "half-page-up",
            ["alt-g"] = "first",
            ["alt-G"] = "last",
         },
      },
   },

   keys = {

      -- Files
      { "<leader>ff",  "<cmd>FzfLua files<cr>",                 desc = "Find files" },
      { "<leader>fe",  "<cmd>FzfLua files cwd=~<cr>",           desc = "Find files at Home" },
      { "<leader>fr",  "<cmd>FzfLua oldfiles<cr>",              desc = "Recent files" },

      -- Search
      { "<leader>fg",  "<cmd>FzfLua live_grep<cr>",             desc = "Live grep" },
      { "<leader>gr",  "<cmd>FzfLua live_grep_native<cr>",      desc = "Live grep native" },
      { "<leader>fw",  "<cmd>FzfLua grep_cword<cr>",            desc = "Grep word under cursor" },
      { "<leader>fW",  "<cmd>FzfLua grep_cWORD<cr>",            desc = "Find current Word" },

      -- Buffers
      { "<leader>fl",  "<cmd>FzfLua buffers<cr>",               desc = "Buffers" },
      { "<leader>fL",  "<cmd>FzfLua lines<cr>",                 desc = "Lines in all buffers" },

      -- LSP
      { "<leader>fd",  "<cmd>FzfLua diagnostics_document<cr>",  desc = "Document diagnostics" },
      { "<leader>fD",  "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace diagnostics" },
      { "<leader>fs",  "<cmd>FzfLua lsp_document_symbols<cr>",  desc = "Document symbols" },
      { "<leader>fS",  "<cmd>FzfLua lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
      { "<leader>fgr", "<cmd>FzfLua lsp_references<cr>",        desc = "LSP references" },
      { "<leader>fgw", "<cmd>FzfLua lsp_finder<cr>",            desc = "LSP finder (all)" },

      -- Git
      { "<leader>gc",  "<cmd>FzfLua git_commits<cr>",           desc = "Git commits" },
      { "<leader>gb",  "<cmd>FzfLua git_branches<cr>",          desc = "Git branches" },
      { "<leader>gs",  "<cmd>FzfLua git_status<cr>",            desc = "Git status" },

      -- Misc
      { "<leader>fk",  "<cmd>FzfLua keymaps<cr>",               desc = "Keymaps" },
      { "<leader>fq",  "<cmd>FzfLua quickfix<cr>",              desc = "Quickfix list" },
      { "<leader>f/",  "<cmd>FzfLua search_history<cr>",        desc = "Search history" },
      { "<leader>fc",  "<cmd>FzfLua command_history<cr>",       desc = "Command history" },
      { "<leader>fu",  "<cmd>FzfLua undotree locate=false<cr>", desc = "Undotree" },
      { "<leader>fh",  "<cmd>FzfLua helptags<cr>",              desc = "Find help" },
      { "<leader>fb",  "<cmd>FzfLua builtin<cr>",               desc = "Find builtin" },
      { "<leader>fp",  "<cmd>FzfLua profiles<cr>",              desc = "Find profiles" },
      { "<leader>cs",  "<cmd>FzfLua colorschemes<cr>",          desc = "Change colorschemes" },
   },
   ---@diagnostic enable: missing-fields
}
