return {
  "Exafunction/codeium.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {},
}
