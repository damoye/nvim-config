return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lualine/lualine.nvim",
  },
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  config = function()
    require("codeium").setup({
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept_word = "<C-k>",
          accept_line = "<C-l>",
          clear = "<C-]>",
        },
      },
    })
    local virtual_text = require("codeium.virtual_text")
    virtual_text.set_statusbar_refresh(require("lualine").refresh)
    vim.keymap.set("i", "<M-Bslash>", virtual_text.complete, { desc = "Codeium Complete" })
    require("lualine").setup({
      sections = {
        lualine_x = {
          function()
            return string.format(" [%s]", require("codeium.virtual_text").status_string())
          end,
          "filetype",
        },
      },
    })
  end,
}
