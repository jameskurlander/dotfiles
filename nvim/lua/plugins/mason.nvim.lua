return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "single",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        --bash
        "bashls",
        -- 'shfmt',
        -- 'shellcheck',

        -- c, c++
        "clangd",

        --javascript, typescript, jsx, tsx, json, css, graphql, html
        -- "biome",
        -- "cssls",
        "graphql",
        "html",
        "tailwindcss",
        "ts_ls",

        --lua
        "lua_ls",
        -- 'luacheck',
        -- 'stylua',

        --php
        -- 'blade-formatter',
        "intelephense",
        "phpactor",

        --other
        "typos_lsp",
      },
    })
  end,
}
