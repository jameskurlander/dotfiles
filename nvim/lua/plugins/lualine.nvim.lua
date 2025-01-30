return {
  'nvim-lualine/lualine.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = 'auto',
        -- theme = function()
        --   local theme = require("lualine.themes.auto") -- Load auto theme
        --   -- Set backgrounds to 'none'
        --   for _, mode in pairs(theme) do
        --     for _, section in pairs(mode) do
        --       section.bg = "none"
        --     end
        --   end
        --   return theme
        -- end,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '', right = '' },
            padding = { left = 1, right = 1 },
          }
        },
        lualine_b = {
          {
            'filetype',
            padding = { left = 1 },
            color = { bg = 'none' },
          }
        },
        lualine_c = {
          {
            'filename',
            path = 1,
            color = { bg = 'none' },
          }
        },
        lualine_x = {
          {
            color = { fg = 'red' },
          }
        },
        lualine_y = {
          {
            'progress',
            separator = { left = '' },
            padding = { left = 1, right = 1 },
            color = { bg = 'none' },
          }
        },
        lualine_z = {
          {
            'location',
            separator = { right = '' },
            padding = { left = 0, right = 1 },
          }
        },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
