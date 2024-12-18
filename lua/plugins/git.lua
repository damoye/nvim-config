return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    keys = { { "<Leader>gb", "<Cmd>BlameToggle<CR>", desc = "Git Blame" } },
    opts = { blame_options = { "-w" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  --stylua: ignore
  keys = {
    { "<Leader>g", "", desc = "+git" },
    { "<Leader>gd", function() require("gitsigns").diffthis() end, desc = "Git Diff" },
    { "<Leader>gD", function() require("gitsigns").diffthis("~") end, desc = "Git Diff~" },
  },
    opts = {},
  },
}
