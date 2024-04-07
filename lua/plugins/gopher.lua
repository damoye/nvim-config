return {
  "olexsmir/gopher.nvim",
  branch = "develop",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap",
  },
  ft = { "go", "gomod" },
  opts = {},
  build = function()
    vim.cmd.GoInstallDeps()
  end,
}
