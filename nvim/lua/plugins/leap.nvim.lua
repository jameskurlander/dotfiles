return {
  "https://codeberg.org/andyg/leap.nvim",
  dependencies = {
    "tpope/vim-repeat",
  },
  config = function()
    require("leap").add_default_mappings()
  end,
}
