local function augroup(name)
    return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

-- 1. Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = augroup("highlight_yank"),
    desc = "Highlight text on yank",
    callback = function()
        (vim.hl or vim.highlight).on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

-- 2. Close Auxiliary Windows with <q>
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("close_with_q"),
    desc = "Close utility windows with q",
    pattern = {
        "PlenaryTestPopup",
        "checkhealth",
        "dbout",
        "gitsigns-blame",
        "help",
        "lspinfo",
        "man",
        "neotest-output-panel",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- 3. Automatic Wrap and Spell for Text Files
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    desc = "Enable line wrap and spell check for text files",
    pattern = { "gitcommit", "markdown", "text" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
