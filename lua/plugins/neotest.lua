return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "fredrikaverpil/neotest-golang",
  },
  --stylua: ignore
  keys = {
    { "<Leader>t", "", desc = "+Test" },
    { "<Leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test File" },
    { "<Leader>tT", function()
      require("neotest").run.run(vim.loop.cwd())
      require("neotest").summary.open()
    end, desc = "Test All" },
    { "<Leader>tr", function() require("neotest").run.run() end, desc = "Test Nearest" },
    { "<Leader>ts", function() require("neotest").summary.toggle() end, desc = "Test Summary" },
    { "<Leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Test Output" },
    { "<Leader>tO", function() require("neotest").output_panel.toggle() end, desc = "Test Output Panel" },
    { "<Leader>tS", function() require("neotest").run.stop() end, desc = "Test Stop" },
  },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("neotest").setup({
      discovery = { enabled = false, concurrent = 0 },
      adapters = {
        require("neotest-golang")({
          go_test_args = { "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
        }),
      },
    })
    require("neotest.logging"):set_level(vim.log.levels.DEBUG)
  end,
}
