return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    keymap = {
      fzf = { ["ctrl-q"] = "select-all+accept" },
    },
  },
  cmd = { "FzfLua" },
  --stylua: ignore
  keys = {
    { "<Leader>f", "", desc = "+find" },
    { "<Leader>ff", "<Cmd>FzfLua files root=false<CR>", desc = "Files" },
    { "<Leader>fr", "<Cmd>FzfLua oldfiles cwd_only=true<CR>", desc = "Recent" },
    { "<Leader>fg", "<Cmd>FzfLua live_grep root=false<CR>", desc = "Grep" },
    { "<Leader>fw", "<Cmd>FzfLua grep_cword root=false<CR>", desc = "Word" },
    { "<Leader>fh", "<Cmd>FzfLua help_tags<CR>", desc = "Helps" },
    { "<Leader>fk", "<Cmd>FzfLua keymaps<CR>", desc = "Keymaps" },
    { "<Leader>ft", "<Cmd>FzfLua colorschemes<CR>", desc = "Colorschemes" },
    {
      "gR",
      function()
        require("fzf-lua").lsp_references({
          jump_to_single_result = true,
          ignore_current_line = true,
          regex_filter = function(item, _)
            local suffix = "_test.go"
            return item.filename:sub(-#suffix) ~= suffix
          end,
        })
      end,
      desc = "References exclude go tests",
    },
  },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lazy").load({ plugins = { "fzf-lua" } })
      require("fzf-lua").register_ui_select()
      return vim.ui.select(...)
    end
  end,
}
