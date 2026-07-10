vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function(args)
    vim.fn.writefile({ args.match }, vim.fn.stdpath("data") .. "/last_colorscheme")
  end,
})
