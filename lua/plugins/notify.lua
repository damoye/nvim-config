return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    vim.notify = require("notify")
    vim.keymap.set("n", "<Leader>u", function()
      require("notify").dismiss({ silent = true, pending = true })
    end, { desc = "Dismiss All Notifications" })
  end,
}
