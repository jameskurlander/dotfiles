return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig");

    --bash
    lspconfig.bashls.setup({});
    -- lspconfig.shfmt.setup({});
    -- lspconfig.shellcheck.setup({});

    --javascript, typescript, jsx, tsx, json, css, graphql, html
    lspconfig.biome.setup({
      cmd = { 'biome', 'lsp-proxy' },
      filetypes = {
        'astro',
        'css',
        'graphql',
        'javascript',
        'javascriptreact',
        'json',
        'jsonc',
        'svelte',
        'typescript',
        'typescript.tsx',
        'typescriptreact',
        'vue',
      },
      root_dir = lspconfig.util.root_pattern('biome.json', 'biome.jsonc'),
      single_file_support = false,
    });
    lspconfig.cssls.setup({});
    lspconfig.graphql.setup({});
    lspconfig.html.setup({});
    lspconfig.tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" }
            },
          },
        },
      },
    })
    });
    lspconfig.ts_ls.setup({});

    --lua
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    });
    -- lspconfig.luacheck.setup({});
    -- lspconfig.stylua.setup({});

    --php
    -- lspconfig.blade_formatter.setup({});
    lspconfig.intelephense.setup({});
    lspconfig.phpactor.setup({
      filetypes = { 'php', 'blade' }
    });

    --other
    lspconfig.typos_lsp.setup({});
  end,
}
