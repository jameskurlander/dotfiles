local M = {}
local splash_ns = vim.api.nvim_create_namespace("startup_splash")

local function find_closest_session()
  local path = vim.fn.expand("%:p:h")
  if path == "" then
    path = vim.fn.getcwd()
  end

  while path ~= "/" do
    local session_file = path .. "/Session.vim"

    if vim.fn.filereadable(session_file) == 1 then
      return session_file
    end

    local parent = vim.fn.fnamemodify(path, ":h")
    if parent == path then
      break
    end
    path = parent
  end

  return nil
end

local function restore_session()
  -- don't restore if files were passed (CLI, Yazi, etc)
  if vim.fn.argc() > 0 then
    return false
  end

  local session = find_closest_session()

  if session then
    vim.cmd("silent source " .. vim.fn.fnameescape(session))
    return true
  end

  return false
end

local function draw_ascii_splash()
  local art = {
    "⠀⠀⠀⠀⠀⢀⣤⣴⣦⣶⣴⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣀⡀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠚⠋⠉⠀⠀⠀⠀⠈⠙⢷⣦⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠾⠛⠛⠉⠉⠛⠛⠷⠄⠀⠀",
    "⠀⠀⠀⠀⢀⣀⣤⣤⣄⣀⠀⠀⠀⠀⠘⠷⠀⠀⠀⠀⠀⠀⣰⠞⠁⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀",
    "⠀⠀⠀⢰⣿⢿⣽⣻⢾⣯⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⣿⢿⣻⣟⣿⣦⠀⠀",
    "⠀⢀⡀⠈⠙⠛⠚⠋⠛⠊⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠾⠿⠽⠾⠓⠋⢀⡀",
    "⠀⣿⠙⠶⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⠞⠋⣷",
    "⠘⣿⠀⠀⡏⠙⠓⠶⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣴⠶⠛⠉⡯⠀⠀⣿",
    "⠀⣿⠀⢀⡇⠀⠀⠀⠀⣿⠛⠛⠲⠶⠦⣦⣤⣤⣤⣤⣤⣶⠶⠶⠚⠛⠛⣿⠀⠀⠀⠀⡇⠀⢠⡟",
    "⠀⢻⡄⢸⡇⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢀⣿⠀⠀⠀⠀⢸⣟⠀⠀⠀⢀⡇⠀⣸⠃",
    "⠀⠈⢷⣸⡇⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⡷⠀⠀⠀⠀⢸⡇⠀⠀⠀⢸⡇⢠⡟⠀",
    "⠀⠀⠈⢿⡇⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⢸⡇⠀⠀⠀⢸⣧⡟⠀⠀",
    "⠀⠀⠀⠈⠳⣄⠀⠀⠀⣿⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⢸⡇⠀⠀⢀⣼⠏⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠘⢷⣄⢰⣟⠀⠀⠀⠀⢰⣯⠀⠀⠀⠀⢸⡇⠀⠀⠀⠀⢸⡇⢀⣤⠞⠁⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠈⠻⢯⣄⡀⠀⠀⢸⡗⠀⠀⠀⠀⢸⡇⠀⠀⠀⢀⣼⠷⠛⠁⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠓⠶⠼⣧⣤⣤⣤⣤⣼⣧⠤⠶⠚⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
  }

  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.swapfile = false

  vim.opt_local.number = false
  vim.opt_local.relativenumber = false
  vim.opt_local.signcolumn = "no"
  vim.opt_local.cursorline = false
  vim.opt_local.wrap = false

  local win_width = vim.api.nvim_win_get_width(0)
  local win_height = vim.api.nvim_win_get_height(0)
  local art_height = #art
  local top_padding = math.max(math.floor((win_height - art_height) / 2), 0)

  local lines = {}
  for _ = 1, top_padding do
    lines[#lines + 1] = ""
  end

  local art_start = #lines + 1
  for _, line in ipairs(art) do
    local line_width = vim.fn.strdisplaywidth(line)
    local left_padding = math.max(math.floor((win_width - line_width) / 2), 0)
    lines[#lines + 1] = string.rep(" ", left_padding) .. line
  end

  while #lines < win_height do
    lines[#lines + 1] = ""
  end

  vim.bo.modifiable = true
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)

  vim.api.nvim_set_hl(0, "StartupAsciiArt", { fg = "Yellow", ctermfg = 3 })
  vim.api.nvim_buf_clear_namespace(0, splash_ns, 0, -1)
  for i = 0, art_height - 1 do
    vim.api.nvim_buf_add_highlight(0, splash_ns, "StartupAsciiArt", art_start - 1 + i, 0, -1)
  end

  vim.bo.modifiable = false
end

function M.setup()
  local session_loaded = restore_session()

  vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
      if session_loaded then
        return
      end

      if vim.fn.argc() > 0 then
        return
      end

      if vim.api.nvim_buf_get_name(0) ~= "" then
        return
      end

      draw_ascii_splash()
    end,
  })
end

return M
