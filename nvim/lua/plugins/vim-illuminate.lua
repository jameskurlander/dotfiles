return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
        delay = 100,
        modes_allowlist = { "n" },
        min_count_to_highlight = 2,
      })
  end,
}
