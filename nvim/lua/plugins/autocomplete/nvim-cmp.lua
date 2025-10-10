return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- snippet engine
    "L3MON4D3/LuaSnip",

    -- snippet collection
    "rafamadriz/friendly-snippets",

    -- completion sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-calc",
    "hrsh7th/cmp-omni",
    "tamago324/cmp-zsh",
    "andersevenrud/cmp-tmux",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp");
    local lspkind = require("lspkind");
    local luasnip = require("luasnip");
    local mappings = {
      ["<CR>"] = cmp.mapping.complete({ select = true }),
      ["<C-Space>"] = cmp.mapping({
        c = function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end
      }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
    };

    require("luasnip.loaders.from_vscode").lazy_load();

    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '…',
        }),
      },
      completion = {
        completeopt = "menu,menuone,preview",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      }),
    });

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(mappings),
      sources = {
        { name = "buffer" },
      },
    });

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(mappings),
      sources = {
        { name = "path" },
        { name = "cmdline" },
      },
    });

    local cmp_autopairs = require("nvim-autopairs.completion.cmp");
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done());
  end,
}
