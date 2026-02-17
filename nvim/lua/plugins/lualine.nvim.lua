return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  config = function()
    -- local function transparent_theme()
    -- 	local theme = require("lualine.themes.auto") -- or any other base theme
    --
    -- 	for _, mode in pairs(theme) do
    -- 		for section, hl in pairs(mode) do
    -- 			hl.bg = "#15141b"
    -- 		end
    -- 	end
    --
    -- 	return theme
    -- end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = "moonlight",
        -- theme = "auto",
        -- theme = transparent_theme(),
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "", right = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          {
            "filetype",
            separator = { left = "", right = "" },
            icon_only = true,
            padding = { left = 1 },
          },
        },
        lualine_c = {
          {
            "filename",
            separator = { left = "", right = "" },
            padding = { left = 0 },
            path = 1,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            separator = { left = "", right = "" },
            padding = { left = 0, right = 0 },
          },
          {
            require("opencode").statusline,
            separator = { left = "", right = "" },
            padding = { right = 2 }
          },
        },
        lualine_y = {
          {
            "progress",
            separator = { left = "" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_z = {
          {
            "location",
            separator = { right = "" },
            padding = { left = 0, right = 1 },
          },
        },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
