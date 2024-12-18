return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "echasnovski/mini.icons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = { { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" } },
  opts = {
    filesystem = { follow_current_file = { enabled = true } },
  },
}
