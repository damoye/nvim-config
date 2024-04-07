return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
    { "nvim-telescope/telescope-fzf-native.nvim", lazy = true, build = "make" },
  },
  cmd = "Telescope",
  keys = {
    { "<Leader>f", "", desc = "+Find" },
    { "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Find by Grep" },
    { "<Leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Find Current Word" },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Find Buffers" },
    { "<Leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Find Recent Files" },
    { "<Leader>fc", "<Cmd>Telescope commands<CR>", desc = "Find Commands" },
    { "<Leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Find Helps" },
    { "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Find Keymaps" },
    {
      "<Leader>ft",
      function()
        require("telescope.builtin").colorscheme({ enable_preview = true, ignore_builtins = true })
      end,
      desc = "Find Themes",
    },
    { "<Leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "Find Diagnostics" },
    { "<Leader>fn", "<Cmd>Telescope notify<CR>", desc = "Find Notifications" },
    {
      "gR",
      "<Cmd>lua require('telescope.builtin').lsp_references({file_ignore_patterns = {'%_test.go'}})<CR>",
      desc = "Goto References Ignoring Tests",
    },
  },
  config = function()
    require("telescope").setup({ extensions = { fzf = {} } })
    require("telescope").load_extension("fzf")
  end,
}
