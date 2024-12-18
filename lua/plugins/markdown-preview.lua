return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  keys = { { "<leader>m", "<cmd>MarkdownPreviewToggle<cr>", desc = "Preview Markdown" } },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
