--theme (must be at top to maintain highlight overrides)
vim.cmd [[colorscheme moonfly]]
vim.opt.background = "dark"
vim.opt.termguicolors = true

--search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = false

--for hiding/showing obsidan markdown
vim.opt.conceallevel = 2

--general
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.guicursor = ''
vim.opt.isfname:append("@-@")
vim.opt.scrolloff = 8
vim.opt.showcmd = false
vim.opt.signcolumn = "yes"
vim.opt.spelllang = "en_us"
vim.opt.updatetime = 50
vim.opt.wrap = true

--indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

--commenting
vim.filetype.get_option = function(filetype, option)
  return option == "commentstring"
    and require("ts_context_commentstring.internal").calculate_commentstring()
    or vim.filetype.get_option(filetype, option)
end

--buffer separator
vim.api.nvim_set_hl(0, "WinSeparator", { fg='#303030', bg = 'none' })
vim.opt.fillchars:append {
  eob = ' ',
  vert = '│',
  horiz = '─',
}

--line numbers
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#778899' })
vim.api.nvim_set_hl(0, 'LineNr', { fg='white' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#778899' })
vim.opt.number = true
vim.opt.relativenumber = true
