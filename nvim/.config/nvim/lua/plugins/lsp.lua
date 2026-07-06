return {
   {
      "neovim/nvim-lspconfig",
      event = {
         "BufReadPre",
         "BufNewFile",
      },
      dependencies = {
         "saghen/blink.cmp",
         "stevearc/conform.nvim",
         "mason-org/mason.nvim",
         "mason-org/mason-lspconfig.nvim",
         "L3MON4D3/LuaSnip",
         "j-hui/fidget.nvim",
      },

      config = function()
         vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
         })

         -------------------------------------------------------------------------
         -- Diagnostics
         -------------------------------------------------------------------------
         vim.diagnostic.config({
            underline = false,
            severity_sort = true,
            update_in_insert = false,
            virtual_text = {
               spacing = 4,
               prefix = "●",
               source = "if_many",
               format = function(diagnostic)
                  local diagnostic_message = {
                     [vim.diagnostic.severity.ERROR] = diagnostic.message,
                     [vim.diagnostic.severity.WARN] = diagnostic.message,
                     [vim.diagnostic.severity.INFO] = diagnostic.message,
                     [vim.diagnostic.severity.HINT] = diagnostic.message,
                  }
                  return diagnostic_message[diagnostic.severity]
               end,
            },

            signs = {
               text = {
                  [vim.diagnostic.severity.ERROR] = " ",
                  [vim.diagnostic.severity.WARN] = " ",
                  [vim.diagnostic.severity.HINT] = "󰠠 ",
                  [vim.diagnostic.severity.INFO] = " ",
               },
            },

            float = {
               border = "rounded",
               source = "if_many",
            },
         })

         -------------------------------------------------------------------------
         -- LspAttach
         -------------------------------------------------------------------------
         vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
               local buf = args.buf

               local map = function(lhs, rhs, desc)
                  vim.keymap.set("n", lhs, rhs, {
                     buffer = buf,
                     silent = true,
                     desc = desc,
                  })
               end

               map("<leader>fo", vim.lsp.buf.format, "Format LSP")
               map("gd", vim.lsp.buf.definition, "Definition")
               map("gD", vim.lsp.buf.declaration, "Declaration")
               map("gr", vim.lsp.buf.references, "References")
               map("gi", vim.lsp.buf.implementation, "Implementation")
               map("gt", vim.lsp.buf.type_definition, "Type Definition")

               map("K", vim.lsp.buf.hover, "Hover")
               map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")

               map("<leader>rn", vim.lsp.buf.rename, "Rename")
               map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

               map("[d", vim.diagnostic.jump, "Previous Diagnostic")
               map("]d", vim.diagnostic.jump, "Next Diagnostic")

               map("<leader>dl", vim.diagnostic.open_float, "Line Diagnostics")

               local client = vim.lsp.get_client_by_id(args.data.client_id)

               if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
                  vim.lsp.inlay_hint.enable(false, {
                     bufnr = buf,
                  })
               end
            end,
         })
      end,
   },
   {
      "mason-org/mason.nvim",
      opts = {
         ui = {
            border = "rounded",
            icons = {
               package_installed = "✓",
               package_pending = "➜",
               package_uninstalled = "✗",
            },
         },
      },
   },
   {
      "mason-org/mason-lspconfig.nvim",
      dependencies = {
         "neovim/nvim-lspconfig",
         "mason-org/mason.nvim",
      },

      opts = {
         ensure_installed = {
            "lua_ls",
            "pyrefly",
            "ts_ls",
            "html",
            "cssls",
            "tailwindcss",
            "svelte",
            "marksman",
            "copilot",
         },
         automatic_enable = true,
      },
   },
   {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      dependencies = {
         "mason-org/mason.nvim",
      },

      opts = {
         ensure_installed = {
            "stylua",
            "ruff",
            "prettier",
            "prettierd",
            "eslint_d",
            "shfmt",
         },
      },
   },
   {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {},
   },
}
