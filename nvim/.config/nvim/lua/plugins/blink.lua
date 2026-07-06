return {
   {
      "saghen/blink.compat",
      version = "*",
      lazy = true,
      opts = {},
   },
   {
      "saghen/blink.cmp",
      version = "1.*",
      dependencies = {
         { "L3MON4D3/LuaSnip", version = "v2.*" },
         { "folke/lazydev.nvim", opts = {} },
         "rafamadriz/friendly-snippets",
         "onsails/lspkind.nvim",
      },

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
         keymap = {
            preset = "default",
            ["<C-space>"] = {
               function(cmp)
                  cmp.show({ providers = { "snippets" } })
               end,
            },
            ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
            ["<C-j>"] = { "select_next", "fallback_to_mappings" },
            ["<Tab>"] = {
               "snippet_forward",
               function() -- sidekick next edit suggestion
                  return require("sidekick").nes_jump_or_apply()
               end,
               function() -- if you are using Neovim's native inline completions
                  return vim.lsp.inline_completion.get()
               end,
               "fallback",
            },
         },

         completion = {
            list = {
               selection = {
                  preselect = true,
                  auto_insert = false,
               },
            },
            menu = {
               scrollbar = false,
               auto_show = true,
               border = "single",
               winhighlight = "Normal:None,FloatBorder:None,CursorLine:BlinkCmpMenuSelection,Search:None",
               draw = {
                  treesitter = { "lsp" },
                  padding = 1,
                  gap = 1,
                  columns = { { "label", "label_description", gap = 2 }, { "kind_icon", gap = 2, "kind" } },
                  components = {
                     kind_icon = {
                        text = function(ctx)
                           local icon = ctx.kind_icon
                           if vim.tbl_contains({ "Path" }, ctx.source_name) then
                              local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                              if dev_icon then
                                 icon = dev_icon
                              end
                           else
                              icon = require("lspkind").symbol_map[ctx.kind] or ""
                           end

                           return icon .. ctx.icon_gap
                        end,

                        -- Optionally, use the highlight groups from nvim-web-devicons
                        -- You can also add the same function for `kind.highlight` if you want to
                        -- keep the highlight groups in sync with the icons.
                        highlight = function(ctx)
                           local hl = ctx.kind_hl
                           if vim.tbl_contains({ "Path" }, ctx.source_name) then
                              local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                              if dev_icon then
                                 hl = dev_hl
                              end
                           end
                           return hl
                        end,
                     },
                  },
               },
            },

            documentation = {
               auto_show = true,
               window = {
                  border = "single",
               },
            },

            ghost_text = {
               enabled = true,
               show_with_selection = true,
               show_without_selection = true,
               show_with_menu = true,
               show_without_menu = true,
            },
         },

         cmdline = {
            keymap = {
               ["<C-y>"] = { "accept_and_enter", "fallback" },
               ["<C-k>"] = { "select_prev", "fallback_to_mappings" },
               ["<C-j>"] = { "select_next", "fallback_to_mappings" },
            },
            -- (optionally) automatically show the menu
            completion = {
               ghost_text = {
                  enabled = true,
               },
               menu = {
                  auto_show = true,
               },
            },
         },

         sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
               buffer = {
                  opts = {
                     get_bufnrs = function()
                        return vim.tbl_filter(function(bufnr)
                           return vim.bo[bufnr].buftype == ""
                        end, vim.api.nvim_list_bufs())
                     end,
                  },
               },
               lazydev = {
                  name = "LazyDev",
                  module = "lazydev.integrations.blink",
                  score_offset = 100,
               },
               cmdline = {
                  min_keyword_length = function(ctx)
                     -- when typing a command, only show when the keyword is 3 characters or longer
                     if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                        return 3
                     end
                     return 0
                  end,
               },
            },
         },
         fuzzy = { implementation = "prefer_rust_with_warning" },
      },
      opts_extend = { "sources.default" },
   },
}
