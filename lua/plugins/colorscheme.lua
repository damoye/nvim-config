return {
  { "Mofiqul/vscode.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "maxmx03/solarized.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      integrations = {
        alpha = true,
        blink_cmp = true,
        dap = true,
        dap_ui = true,
        fzf = true,
        gitsigns = true,
        indent_blankline = { enabled = true },
        mason = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotest = true,
        neotree = true,
        semantic_tokens = true,
        snacks = true,
        treesitter = true,
        which_key = true,
      },
      custom_highlights = function(colors)
        return {
          WinSeparator = { fg = colors.overlay0 },
        }
      end,
    },
  },
}
