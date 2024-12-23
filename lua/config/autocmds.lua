-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

LazyVim.format.register(LazyVim.lsp.formatter({
  name = "go.organizeImports",
  primary = false,
  format = function(buf)
    local params = {
      textDocument = vim.lsp.util.make_text_document_params(buf),
      only = { "source.organizeImports" },
    }
    local result = vim.lsp.buf_request_sync(buf, "textDocument/codeAction", params, 10000)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = vim.lsp.get_client_by_id(cid).offset_encoding
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
  end,
  sources = function(buf)
    if vim.bo[buf].filetype == "go" then
      return { "go.organizeImports" }
    end
    return {}
  end,
}))
