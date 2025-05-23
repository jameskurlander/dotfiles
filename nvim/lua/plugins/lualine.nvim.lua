return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = 'auto',
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
            separator = { left = '', right = '' },
            icon_only = true,
            padding = { left = 1 },
            color = { bg = 'none' }
          },
        },
        lualine_c = {
          {
            'filename',
            separator = { left = '', right = '' },
            padding = { left = 0 },
            path = 1,
          }
        },
        lualine_x = {
          {
            'diagnostics',
            separator = { left = '', right = '' },
            padding = { left = 0, right = 0 },
          }
        },
        lualine_y = {
          {
            'progress',
            separator = { left = '' },
            padding = { left = 1, right = 1 },
            color = { bg = 'none' }
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
