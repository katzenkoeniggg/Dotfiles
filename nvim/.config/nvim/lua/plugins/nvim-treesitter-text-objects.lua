return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	branch = "main",
	event = "VeryLazy",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	init = function()
		-- Disable built-in ftplugin maps so they don't conflict with your custom ones.
		-- You can selectively disable by filetype (e.g., vim.g.no_ruby_maps = true)
		-- or disable all of them globally:
		vim.g.no_plugin_maps = true
	end,
	config = function()
		-- 1. Configure the core options (lookahead, selection modes, etc.)
		require("nvim-treesitter-textobjects").setup({
			select = {
				-- Automatically jump forward to a textobj, similar to targets.vim
				lookahead = true,

				-- Choose the select mode (default is charwise 'v')
				selection_modes = {
					["@parameter.outer"] = "v", -- charwise
					["@function.outer"] = "V", -- linewise
					["@class.outer"] = "<c-v>", -- blockwise
				},
				include_surrounding_whitespace = false,
			},
			move = {
				set_jumps = true, -- Add jumps to the jumplist
			},
		})

		-- 2. Text object selection keymaps
		-- Note: We use 'f' for function, 'c' for class, and 's' for scope
		local select = require("nvim-treesitter-textobjects.select")

		vim.keymap.set({ "x", "o" }, "af", function()
			select.select_textobject("@function.outer", "textobjects")
		end, { desc = "Select outer part of a function" })
		vim.keymap.set({ "x", "o" }, "if", function()
			select.select_textobject("@function.inner", "textobjects")
		end, { desc = "Select inner part of a function" })
		vim.keymap.set({ "x", "o" }, "ac", function()
			select.select_textobject("@class.outer", "textobjects")
		end, { desc = "Select outer part of a class" })
		vim.keymap.set({ "x", "o" }, "ic", function()
			select.select_textobject("@class.inner", "textobjects")
		end, { desc = "Select inner part of a class" })
		vim.keymap.set({ "x", "o" }, "as", function()
			select.select_textobject("@local.scope", "locals")
		end, { desc = "Select language scope" })

		-- 3. Text object swapping keymaps
		local swap = require("nvim-treesitter-textobjects.swap")

		vim.keymap.set("n", "<leader>a", function()
			swap.swap_next("@parameter.inner")
		end, { desc = "Swap with next parameter" })
		vim.keymap.set("n", "<leader>A", function()
			swap.swap_previous("@parameter.outer")
		end, { desc = "Swap with previous parameter" })

		-- 4. Text object movement keymaps
		local move = require("nvim-treesitter-textobjects.move")

		vim.keymap.set({ "n", "x", "o" }, "]f", function()
			move.goto_next_start("@function.outer", "textobjects")
		end, { desc = "Go to next function start" })
		vim.keymap.set({ "n", "x", "o" }, "]c", function()
			move.goto_next_start("@class.outer", "textobjects")
		end, { desc = "Go to next class start" })
		vim.keymap.set({ "n", "x", "o" }, "[f", function()
			move.goto_previous_start("@function.outer", "textobjects")
		end, { desc = "Go to previous function start" })
		vim.keymap.set({ "n", "x", "o" }, "[c", function()
			move.goto_previous_start("@class.outer", "textobjects")
		end, { desc = "Go to previous class start" })

		-- 5. Make movements repeatable with ; and ,
		local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

		-- Ensure ; goes forward and , goes backward regardless of the last direction
		vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
		vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

		-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
		vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
		vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
	end,
}
