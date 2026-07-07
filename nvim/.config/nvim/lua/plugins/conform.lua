return {
   "stevearc/conform.nvim",
   event = { "BufWritePre", "BufReadPre", "BufNewFile" },
   cmd = { "ConformInfo" },
   dependencies = { "mason-org/mason.nvim" },
   keys = {
      {
         "<leader>fm",
         function()
            require("conform").format({
               lsp_format = "fallback",
               async = false,
               timeout_ms = 1000,
            })
         end,
         mode = "",
         desc = "Format buffer",
      },
   },

   -- This will provide type hinting with LuaLS
   ---@module "conform"
   ---@type conform.setupOpts
   opts = {
      fortmat_on_save = {
         lsp_format = "fallback",
         async = false,
         timeout_ms = 500,
      },
      formatters_by_ft = {
         javascript = { "prettierd", "prettier" },
         typescript = { "prettierd", "prettier" },
         javascriptreact = { "prettierd", "prettier" },
         typescriptreact = { "prettierd", "prettier" },
         svelte = { "prettierd", "prettier" },
         css = { "prettierd", "prettier" },
         html = { "prettierd", "prettier" },
         json = { "prettierd", "prettier" },
         yaml = { "prettierd", "prettier" },
         markdown = { "prettierd", "prettier" },
         graphql = { "prettierd", "prettier" },
         liquid = { "prettierd", "prettier" },
         lua = { "stylua" },
         python = { "ruff" },
         sh = { "shfmt" },
      },

      formatters = {
         shfmt = {
            append_args = { "-i", "2" },
         },
      },
   },
}
