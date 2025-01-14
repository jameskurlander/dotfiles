return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig");

    lspconfig.cssls.setup({});
    lspconfig.somesass_ls.setup({});
    lspconfig.graphql.setup({});
    lspconfig.html.setup({});
    lspconfig.lua_ls.setup({});
    lspconfig.ts_ls.setup({});
    lspconfig.eslint.setup({});
    lspconfig.phpactor.setup({
        filetypes = { 'php', 'blade' },
      });
    lspconfig.tailwindcss.setup({});

    lspconfig.typos_lsp.setup({
        cmd_env = { RUST_LOG = "error" },
        init_options = {
          config = "~/code/typos-lsp/crates/typos-lsp/tests/typos.toml",
          diagnosticSeverity = "Hint",
        },
      });
  end,
}
