-- vim.opt.guicursor = ""

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.smoothscroll = true
-- vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.mouse = "a" -- Enable mouse mode

vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.tabstop = 3
vim.opt.softtabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.updatetime = 50
-- vim.opt.clipboard = "unnamedplus"  -- sync with system clipboard (needs wl-clipboard on Wayland)

vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.cmdheight = 0

vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
