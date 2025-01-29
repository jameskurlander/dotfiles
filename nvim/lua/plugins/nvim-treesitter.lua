return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync", "TSInstall", "TSBufEnable", "TSBufDisable" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "css",
      "graphql",
      "html",
      "javascript",
      "json",
      "lua",
      "php",
      "typescript",
      "tsx",
      "yaml",
    },
    sync_install = false,
    auto_install = false,
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
