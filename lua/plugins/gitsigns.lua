return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  --stylua: ignore
  keys = {
    { "<Leader>g", "", desc = "+Git" },
    { "<Leader>gd", function() require("gitsigns").diffthis() end, desc = "Git Diff" },
    { "<Leader>gD", function() require("gitsigns").diffthis("~") end, desc = "Git Diff~" },
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
    },
  },
}
