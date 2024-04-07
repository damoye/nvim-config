return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    local servers = {
      gopls = { settings = { gopls = { gofumpt = true } } },
      lua_ls = { settings = { Lua = { completion = { callSnippet = "Replace" } } } },
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { "gofumpt", "stylua" })
    require("mason").setup()
    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = capabilities
          require("lspconfig")[server_name].setup(server)
        end,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Information" })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
      end,
    })
    -- organize imports on write for golang
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.go" },
      callback = function(args)
        --- @diagnostic disable-next-line:deprecated
        local params = vim.lsp.util.make_range_params(0, vim.lsp.util._get_offset_encoding(args.buf))
        --- @diagnostic disable-next-line:inject-field
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 5000)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = vim.lsp.get_client_by_id(cid).offset_encoding
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
      end,
    })
  end,
}
