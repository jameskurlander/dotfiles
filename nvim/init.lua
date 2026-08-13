vim.loader.enable()

require("config.lazy")
require("config.startup").setup()
require("config.settings")
require("config.keybinds")

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = false, underline = true, sp = "#FF0000" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = false, underline = true, sp = "#FFA500" }) -- Optional: Orange for warnings
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = false, underline = true, sp = "#00FFFF" }) -- Optional: Cyan for info
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = false, underline = true, sp = "#ADD8E6" }) -- Optional: Light blue for hints
