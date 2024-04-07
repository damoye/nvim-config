return {
  { "AstroNvim/astrotheme", lazy = true, opts = { background = { light = "astrolight", dark = "astrodark" } } },
  { "Mofiqul/vscode.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },
  { "maxmx03/solarized.nvim", lazy = true },
  { "navarasu/onedark.nvim", lazy = true },
  { "projekt0n/github-nvim-theme", lazy = true },
  { "rebelot/kanagawa.nvim", lazy = true },
  {
    "catppuccin/nvim",
    config = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
