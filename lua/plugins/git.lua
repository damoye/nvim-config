return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    keys = {
      { "<Leader>g", "", desc = "+git" },
      { "<Leader>gb", "<Cmd>BlameToggle<CR>", desc = "Git Blame" },
    },
    opts = { blame_options = { "-w" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      on_attach = function(buffer)
        local gs = require("gitsigns")

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gs.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gs.nav_hunk("prev")
          end
        end, "Prev Hunk")

        map("n", "<leader>gd", gs.diffthis, "Git Diff")
        map("n", "<leader>gD", function()
          gs.diffthis("~")
        end, "Git Diff ~")
      end,
    },
  },
}
