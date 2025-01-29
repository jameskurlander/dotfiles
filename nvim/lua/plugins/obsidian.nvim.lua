return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  -- ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    disable_frontmatter = false,
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    workspaces = {
      {
        name = "work",
        path = "~/vaults",
      },
    },
  },
}
