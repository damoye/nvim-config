local cover_file = os.tmpname()
return {
  {
    "nvim-neotest/neotest",
    opts = {
      discovery = { enabled = false },
      adapters = {
        ["neotest-golang"] = {
          go_test_args = { "-coverprofile=" .. cover_file },
        },
      },
    },
  },
  {
    "andythigpen/nvim-coverage",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>tc",
        function()
          local coverage = require("coverage")
          local signs = require("coverage.signs")
          if signs.is_enabled() then
            coverage.clear()
          else
            coverage.load(true)
          end
        end,
        desc = "Test Coverage",
      },
    },
    opts = {
      auto_reload = true,
      lang = {
        go = { coverage_file = cover_file },
      },
    },
  },
}
