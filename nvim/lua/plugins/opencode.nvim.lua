return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  init = function()
    vim.g.opencode_opts = vim.tbl_deep_extend("force", vim.g.opencode_opts or {}, {
      ask = {
        snacks = {
          expand = false,
          win = {
            relative = "editor",
            win = 0,
            row = -1,
            col = 0,
            width = 0,
            title_pos = "left",
          },
        },
      },
    })
  end,
}
