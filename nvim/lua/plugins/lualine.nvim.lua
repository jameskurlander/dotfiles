local colors = {
  moonstone = '#72B5C1',
  green = '#00e49a',
  orange = '#fbc300',
  red = '#ef766d',
  pink = '#FF9FB0',
  darkGray = '#2A2F3E',
  lightGray = '#B0BACF',
  black = '#14161B',
}

function ConfigureLualine()
    require('lualine').setup {
      options = {
        globalstatus = true,
        theme = {
          normal = {
            a = {bg = colors.moonstone, fg = colors.black, gui = 'bold'},
            b = {bg = colors.darkGray, fg = colors.moonstone},
            c = {bg = 'none', fg = colors.lightGray},
          },
          insert = {
            a = {bg = colors.green, fg = colors.black, gui = 'bold'},
            b = {bg = colors.darkGray, fg = colors.green},
            c = {bg = 'none', fg = colors.lightGray},
          },
          visual = {
            a = {bg = colors.pink, fg = colors.black, gui = 'bold'},
            b = {bg = colors.darkGray, fg = colors.pink},
            c = {bg = 'none', fg = colors.lightGray},
          },
          replace = {
            a = {bg = colors.red, fg = colors.black, gui = 'bold'},
            b = {bg = colors.darkGray, fg = colors.red},
            c = {bg = 'none', fg = colors.lightGray},
          },
          command = {
            a = {bg = colors.orange, fg = colors.black, gui = 'bold'},
            b = {bg = colors.darkGray, fg = colors.orange},
            c = {bg = 'none', fg = colors.lightGray},
          },
        },
        icons_enabled = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '█', right = '█' },
            padding = { left = 0, right = 0 },
          }
        },
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            color = { bg = 'none' },
          }
        },
        lualine_x = {},
        lualine_y = {
          {
            'progress',
             separator = { left = '█' },
             padding = { left = 0, right = 1 },
          }
        },
        lualine_z = {
          {
            'location',
             separator = { right = '█' },
             padding = { left = 0, right = 0 },
          }
        },
      },
      tabline = {},
      extensions = {},
    }
  end

return {
  'nvim-lualine/lualine.nvim',
  lazy = false,
  config = ConfigureLualine,
}
