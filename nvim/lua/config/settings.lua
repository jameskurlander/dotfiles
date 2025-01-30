vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.background = "dark"
vim.opt.conceallevel = 2
vim.opt.guicursor = ""
vim.opt.spelllang = "en_us"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.laststatus = 2
vim.opt.fillchars:append({
  eob = " ",
})

local highlightSettings = { fg="black", bg = "#00e49a", underline = false }

vim.api.nvim_set_hl(0, "IlluminatedWordText", highlightSettings)
vim.api.nvim_set_hl(0, "IlluminatedWordRead", highlightSettings)
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", highlightSettings)

vim.cmd([[
  highlight DashboardHeader guifg=#f1fa8c
  highlight DashboardCenter guifg=#ff79c6
  highlight DashboardFooter guifg=#f8f8f2
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
]])

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#778899' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#778899' })

vim.cmd [[colorscheme moonfly]]
