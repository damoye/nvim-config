return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = { { "<Leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle File Explorer" } },
  config = function()
    require("neo-tree").setup({
      filesystem = { follow_current_file = { enabled = true } },
      buffers = { follow_current_file = { enable = true } },
    })
  end,
}
