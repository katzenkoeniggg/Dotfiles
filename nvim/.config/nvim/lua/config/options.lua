local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.smoothscroll = true
-- opt.list = true -- Show some invisible characters (tabs...
opt.linebreak = true -- Wrap lines at convenient points
opt.cursorline = true -- Enable highlighting of the current line

opt.laststatus = 3
opt.showtabline = 2
opt.tabstop = 3
opt.softtabstop = 3
opt.shiftwidth = 3
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.signcolumn = "yes"

opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.updatetime = 50
-- opt.clipboard = "unnamedplus"  -- sync with system clipboard (needs wl-clipboard on Wayland)

opt.hlsearch = false
opt.incsearch = true

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
