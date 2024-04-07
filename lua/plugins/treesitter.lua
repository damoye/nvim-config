return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  lazy = vim.fn.argc(-1) == 0,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    ensure_installed = { "go", "lua", "markdown_inline" },
    auto_install = true,
    highlight = { enable = true },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = { ["<Leader>a"] = "@parameter.inner" },
        swap_previous = { ["<Leader>A"] = "@parameter.inner" },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if pcall(vim.treesitter.start) then
          vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
          vim.opt_local.foldmethod = "expr"
        end
      end,
    })
  end,
  build = ":TSUpdate",
}
