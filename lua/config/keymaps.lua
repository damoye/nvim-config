-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "gR", function()
  require("fzf-lua").lsp_references({
    jump_to_single_result = true,
    ignore_current_line = true,
    regex_filter = function(item, _)
      local suffix = "_test.go"
      return item.filename:sub(-#suffix) ~= suffix
    end,
  })
end, { desc = "References exclude go tests" })
