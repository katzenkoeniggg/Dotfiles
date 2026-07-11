return {
  "katzenkoeniggg/colorify-fork",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    mode = "virtual",
    highlight = { hex = true, lspvars = true },
  },
}
