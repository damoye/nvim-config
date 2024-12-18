return {
  "saghen/blink.cmp",
  version = "*",
  opts_extend = { "sources.default", "sources.compat" },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "saghen/blink.compat",
  },
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { ["<C-enter>"] = { "show" } },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
    sources = {
      compat = { "codeium", "avante_commands", "avante_mentions", "avante_files" },
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = {},
      providers = {
        codeium = {
          kind = "Codeium",
          score_offset = 100,
          async = true,
        },
      },
    },
    signature = { enabled = true, window = { border = "single" } },
    appearance = { kind_icons = { Codeium = "󰘦" } },
  },
  ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
  config = function(_, opts)
    local enabled = opts.sources.default
    for _, source in ipairs(opts.sources.compat or {}) do
      opts.sources.providers[source] = vim.tbl_deep_extend(
        "force",
        { name = source, module = "blink.compat.source" },
        opts.sources.providers[source] or {}
      )
      if type(enabled) == "table" then
        table.insert(enabled, source)
      end
    end
    opts.sources.compat = nil

    for _, provider in pairs(opts.sources.providers or {}) do
      ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
      if provider.kind then
        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
        local kind_idx = #CompletionItemKind + 1
        CompletionItemKind[kind_idx] = provider.kind
        CompletionItemKind[provider.kind] = kind_idx

        ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
        local transform_items = provider.transform_items
        ---@param ctx blink.cmp.Context
        ---@param items blink.cmp.CompletionItem[]
        provider.transform_items = function(ctx, items)
          items = transform_items and transform_items(ctx, items) or items
          for _, item in ipairs(items) do
            item.kind = kind_idx or item.kind
          end
          return items
        end
        provider.kind = nil
      end
    end

    require("blink.cmp").setup(opts)
  end,
}
