return {
  "j-hui/fidget.nvim",
  opts = {
    notification = {
      override_vim_notify = true,
      -- How to configure notification groups when instantiated
      redirect = function(msg, level, opts)
        if opts and opts.on_open then
          return require("fidget.integration.nvim-notify").delegate(msg, level, opts)
        end
      end,
    },
  },
}
