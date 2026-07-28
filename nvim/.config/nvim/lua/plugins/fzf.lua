return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    ---@module "fzf-lua"
    ---@type fzf-lua.Config | { }
    ---@diagnostic disable: missing-fields

    opts = {
        ui_select = {
            winopts = {
                height = 0.6,
                width = 0.4,
                row = 0.3, -- Vertical position (0 = top, 1 = bottom)
                col = 0.5, -- Horizontal position (0 = left, 1 = right)
                border = "none", -- 'single', 'double', 'rounded', 'solid', 'shadow'
            },
        },
        fzf_colors = false,
        winopts = {
            border = "none",
            backdrop = 100,
            preview = {
                -- default = "bat",
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
        grep = {
            hidden = true,
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

    ---@diagnostic enable: missing-fields
}
