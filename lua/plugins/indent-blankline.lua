return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = { scope = { enabled = false } },
  main = "ibl",
}
