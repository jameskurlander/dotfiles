return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    --bash
    vim.lsp.enable("bashls")
    vim.lsp.enable("shfmt")
    vim.lsp.enable("shellcheck")

    -- c, c++
    vim.lsp.enable("clangd")
    vim.lsp.enable("clang-format")
    vim.lsp.enable("cpplint")

    --javascript, typescript, jsx, tsx, json, css, graphql, html
    vim.lsp.enable("biome", {
      cmd = { "biome", "lsp-proxy" },
      filetypes = {
        "astro",
        "css",
        "graphql",
        "javascript",
        "javascriptreact",
        "json",
        "jsonc",
        "svelte",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "vue",
      },
      root_dir = lspconfig.util.root_pattern("biome.json", "biome.jsonc"),
      single_file_support = false,
    })

    vim.lsp.enable("cssls")
    vim.lsp.enable("graphql")
    vim.lsp.enable("html")
    vim.lsp.enable("tailwindcss", {
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
            },
          },
        },
      },
    })
    vim.lsp.enable("ts_ls")

    --lua
    vim.lsp.enable("lua_ls", {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    -- vim.lsp.enable("luacheck")
    -- vim.lsp.enable("stylua")

    --php
    -- vim.lsp.enable("blade_formatter");
    vim.lsp.enable("intelephense")
    vim.lsp.enable("phpactor", {
      filetypes = { "php", "blade" },
    })

    --other
    vim.lsp.enable("typos_lsp")
  end,
}
