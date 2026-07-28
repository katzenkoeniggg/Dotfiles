vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- source current file (reload config)
map("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- disable Q (dangerous in vim)
map("n", "Q", "<nop>")

-- Ctrl+C as Escape in insert mode
-- map("i", "<C-c>", "<Esc>")

map("v", "J", ":m '>+1<cr>gv=gv") -- move selection down
map("v", "K", ":m '<-2<cr>gv=gv") -- move selection up

map("n", "<C-d>", "<C-d>zz") -- scroll down, stay centered
map("n", "<C-u>", "<C-u>zz") -- scroll up, stay centered
map("n", "n", "nzzzv") -- next search result, centered
map("n", "N", "Nzzzv") -- prev search result, centered
map("n", "J", "mzJ`z") -- join lines without moving cursor

map({ "n", "v" }, "<leader>y", [["+y]]) -- yank to system clipboard
map("n", "<leader>Y", [["+Y]]) -- yank to system clipboard
map({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
map({ "n", "v" }, "<leader>P", [["+P]], { desc = "Paste before from system clipboard" })
map("x", "P", [["_dP]]) -- paste over selection WITHOUT losing clipboard (greatest remap ever)
map({ "n", "v" }, "<leader>d", [["_d]]) -- delete to void register (doesn't overwrite clipboard)

map("n", "<C-k>", "<cmd>cnext<cr>zz") -- next quickfix item
map("n", "<C-j>", "<cmd>cprev<cr>zz") -- prev quickfix item
map("n", "<leader>k", "<cmd>lnext<cr>zz") -- next location list
map("n", "<leader>j", "<cmd>lprev<cr>zz") -- prev location list

-- search and replace word under cursor
map("n", "<leader>re", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
map("n", "<leader>xe", "<cmd>!chmod +x %<cr>", { silent = true, desc = "Make executable" })

-- open tmux sessionizer (his project switcher)
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")

-- ─── Buffers ──────────────────────────────────────────────────────────────
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Close buffer" })
map("n", "<leader>BD", "<cmd>%bd | e #<cr>", { desc = "Close other buffer" })
map("n", "<leader>bD", "<cmd>bd!<cr>", { desc = "Force close buffer" })
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })

-- ─── Windows (splits) ─────────────────────────────────────────────────────
map("n", "<C-h>", "<C-w>h", { desc = "Focus left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

map("n", "<leader>wv", "<cmd>vsp<cr>", { desc = "Vertical split" })
map("n", "<leader>ws", "<cmd>sp<cr>", { desc = "Horizontal split" })
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "Close other windows" })

-- resize splits with arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase width" })

-- ─── Tabs (native vim tabs) ───────────────────────────────────────────────
-- map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
-- map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close tab" })
-- map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close other tabs" })
-- map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
-- map("n", "<S-Tab>", "<cmd>tabprevious<cr>", { desc = "Prev tab" })

--- Lazy
map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy UI" })

--- Fzf
-- Files
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
map("n", "<leader>fe", "<cmd>FzfLua files cwd=~<cr>", { desc = "Find files at Home" })
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent files" })

-- Search
map("n", "<leader>lg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>gr", "<cmd>FzfLua live_grep_native<cr>", { desc = "Live grep native" })
map("n", "<leader>fw", "<cmd>FzfLua grep_cword<cr>", { desc = "Grep word under cursor" })
map("n", "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", { desc = "Find current Word" })

-- Buffers
map("n", "<leader>fl", "<cmd>FzfLua buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fL", "<cmd>FzfLua lines<cr>", { desc = "Lines in all buffers" })

-- LSP
map("n", "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "Document diagnostics" })
map("n", "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Workspace diagnostics" })
map("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<cr>", { desc = "Workspace symbols" })
map("n", "<leader>fgr", "<cmd>FzfLua lsp_references<cr>", { desc = "LSP references" })
map("n", "<leader>fgw", "<cmd>FzfLua lsp_finder<cr>", { desc = "LSP finder (all)" })

-- Git
map("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", { desc = "Git commits" })
map("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>", { desc = "Git branches" })
map("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "Git status" })

-- Misc
map("n", "<leader>fk", "<cmd>FzfLua keymaps<cr>", { desc = "Keymaps" })
map("n", "<leader>fq", "<cmd>FzfLua quickfix<cr>", { desc = "Quickfix list" })
map("n", "<leader>f/", "<cmd>FzfLua search_history<cr>", { desc = "Search history" })
map("n", "<leader>fc", "<cmd>FzfLua command_history<cr>", { desc = "Command history" })
map("n", "<leader>fu", "<cmd>FzfLua undotree locate=false<cr>", { desc = "Undotree" })
map("n", "<leader>fh", "<cmd>FzfLua helptags<cr>", { desc = "Find help" })
map("n", "<leader>fb", "<cmd>FzfLua builtin<cr>", { desc = "Find builtin" })
map("n", "<leader>fp", "<cmd>FzfLua profiles<cr>", { desc = "Find profiles" })
map("n", "<leader>cs", "<cmd>FzfLua colorschemes<cr>", { desc = "Change colorschemes" })
