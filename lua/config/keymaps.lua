vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Switch Left Window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Switch Lower Window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Switch Upper Window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Switch Right Window" })

vim.keymap.set("n", "<ESC>", vim.cmd.nohlsearch, { desc = "Clear Highlights" })

vim.keymap.set({ "i", "x", "n", "s" }, "<C-q>", vim.cmd.quit, { desc = "Quit File" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", vim.cmd.write, { desc = "Save File" })

vim.keymap.set("n", "<Leader>q", function()
  if vim.fn.getqflist({ winid = 0 }).winid == 0 then
    vim.cmd.copen()
  else
    vim.cmd.cclose()
  end
end, { desc = "Toggle Quickfix" })

vim.keymap.set("n", "<Leader>l", function()
  if vim.fn.getloclist(0, { winid = 0 }).winid == 0 then
    vim.cmd.lopen()
  else
    vim.cmd.lclose()
  end
end, { desc = "Toggle LocList" })
vim.keymap.set("n", "<Leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
