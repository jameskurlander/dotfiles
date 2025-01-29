return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig");

    --bash
    lspconfig.bashls.setup({});
    -- lspconfig.shfmt.setup({});
    -- lspconfig.shellcheck.setup({});

    --javascript, typescript, jsx, tsx, json, css, graphql, html
    lspconfig.biome.setup({});
    lspconfig.cssls.setup({});
    lspconfig.graphql.setup({});
    lspconfig.html.setup({});
    lspconfig.tailwindcss.setup({});
    lspconfig.ts_ls.setup({});

    --lua
    lspconfig.lua_ls.setup({});
    -- lspconfig.luacheck.setup({});
    -- lspconfig.stylua.setup({});

    --php
    -- lspconfig.blade_formatter.setup({});
    lspconfig.intelephense.setup({});
    lspconfig.phpactor.setup({ filetypes = { 'php', 'blade' } });

    --other
    lspconfig.typos_lsp.setup({});
  end,
}
