return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = { lua = { "stylua" } },
    format_on_save = { lsp_format = "fallback", timeout_ms = 5000 },
  },
}
