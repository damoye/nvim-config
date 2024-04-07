return {
  "FabijanZulj/blame.nvim",
  cmd = "BlameToggle",
  keys = { { "<Leader>gb", "<Cmd>BlameToggle<CR>", desc = "Git Blame" } },
  opts = { blame_options = { "-w" } },
}
