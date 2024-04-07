return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  keys = { { "<Leader>m", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Preview Markdown" } },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
}
