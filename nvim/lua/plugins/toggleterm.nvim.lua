return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      start_in_insert = true,
      insert_mappings = true,
      shade_terminals = false,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      highlights = {
        FloatBorder = {
          guifg = "#303030",
          guibg = "none",
        },
        NormalFloat = {
          guibg = "none",
        },
      },
    })
  end,
}
