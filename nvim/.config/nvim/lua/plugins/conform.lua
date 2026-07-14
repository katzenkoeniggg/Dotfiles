return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",

    -- This will provide type hinting with LuaLS
    ---@module "conform"
    ---@type conform.setupOpts
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
            injected = { options = { ignore_errors = true } },
            shfmt = { append_args = { "-i", "4" } },
            taplo = {
                append_args = {
                    "--option",
                    "indent_string=    ", -- four literal spaces
                },
            },
            stylua = {
                append_args = {
                    "--indent-type",
                    "Spaces",
                    "--indent-width",
                    "4",
                },
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
