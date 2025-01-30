vim.loader.enable()

require("config.lazy");
require("config.settings");
require("config.keybinds");

local function find_closest_session()
  local path = vim.fn.expand('%:p:h')

  while path ~= "/" do
    local session_file = path .. "/Session.vim"

    if vim.fn.filereadable(session_file) == 1 then
      return session_file
    end

    path = vim.fn.fnamemodify(path, ':h')
  end

  return nil
end

local session = find_closest_session()

if session then
  vim.cmd('source ' .. session)
end

vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = false, underline = true, sp = "#FF0000" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = false, underline = true, sp = "#FFA500" }) -- Optional: Orange for warnings
vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { undercurl = false, underline = true, sp = "#00FFFF" }) -- Optional: Cyan for info
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = false, underline = true, sp = "#ADD8E6" }) -- Optional: Light blue for hints
