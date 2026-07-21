return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false, -- this plugin does not support lazy-loading
    build = ":TSUpdate", -- keeps installed parsers current after plugin updates

    config = function()
        require("nvim-treesitter").setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        require("nvim-treesitter").install({
            "bash",
            "c",
            "css",
            "diff",
            "dockerfile",
            "gitignore",
            "graphql",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "printf",
            "prisma",
            "python",
            "query",
            "regex",
            "svelte",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
            "zsh",
        })

        -- highlighting is opt-in per filetype since main dropped
        -- the old `highlight = { enable = true }` config option
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "*",
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })

        -- treesitter-based folding (provided by Neovim core, not the plugin)
        -- vim.o.foldmethod = "expr"
        -- vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

        -- treesitter-based indentation (provided by the plugin, marked experimental)
        -- vim.api.nvim_create_autocmd("FileType", {
        --     pattern = "*",
        --     callback = function()
        --         pcall(function()
        --             vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        --         end)
        --     end,
        -- })
    end,
}
