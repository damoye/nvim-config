return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    { "williamboman/mason.nvim", config = true },
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = { gofumpt = true, staticcheck = true, semanticTokens = true },
        },
      },
      lua_ls = { settings = { Lua = { completion = { callSnippet = "Replace" } } } },
    },
  },
  config = function(_, opts)
    require("mason-lspconfig").setup({ automatic_installation = true })

    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      require("blink.cmp").get_lsp_capabilities()
    )

    local servers = opts.servers
    for server, server_opts in pairs(servers) do
      require("lspconfig")[server].setup(vim.tbl_deep_extend("force", {
        capabilities = vim.deepcopy(capabilities),
      }, server_opts or {}))
    end

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
        local params = {
          textDocument = vim.lsp.util.make_text_document_params(args.buf),
          only = { "source.organizeImports" },
        }
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
