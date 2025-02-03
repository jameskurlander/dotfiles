return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- Enable for all filetypes
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- Disable "Color Names" like 'red'
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        rgb_fn = true,       -- Enable rgb() and rgba() functions
        hsl_fn = true,       -- Enable hsl() and hsla() functions
        css = true,          -- Enable all CSS properties
        css_fn = true,       -- Enable all CSS functions
        mode = "background", -- Display color as background
      },
    })
  end,
}
