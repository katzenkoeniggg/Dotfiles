return {
   "stevearc/conform.nvim",
   opts = {
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
         toml = { "taplo" },
         markdown = { "prettierd", "prettier" },
         graphql = { "prettierd", "prettier" },
         liquid = { "prettierd", "prettier" },
         lua = { "stylua" },
         python = { "ruff" },
         sh = { "shfmt" },
      },

      format_on_save = {
         lsp_format = "fallback",
         timeout_ms = 500,
      },

      formatters = {
         shfmt = {
            append_args = { "-i", "2" },
         },
      },
   },

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
}
