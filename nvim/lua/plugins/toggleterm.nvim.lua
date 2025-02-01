return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = 'horizontal',
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'single',
        width = 80,
        height = 40,
        winblend = 3,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
  end,
}
