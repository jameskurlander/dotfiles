-- theme (must be at top to maintain highlight overrides)
vim.cmd.colorscheme("moonlight")
-- vim.cmd.colorscheme("tokyonight-night")
vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = false

-- for hiding/showing obsidan markdown
vim.opt.conceallevel = 0

-- general
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 1
vim.opt.guicursor = ""
vim.opt.isfname:append("@-@")
vim.opt.scrolloff = 8
vim.opt.showcmd = false
vim.opt.signcolumn = "yes"
vim.opt.spelllang = "en_us"
vim.opt.updatetime = 50
vim.opt.wrap = true

-- indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- commenting
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or vim.filetype.get_option(filetype, option)
end

-- buffer separator
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#303030", bg = "none" })
vim.opt.fillchars:append({
	eob = " ",
	vert = "│",
	horiz = "─",
})

-- line numbers
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#778899" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#778899" })
vim.opt.number = false

-- highlighting modifications
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#303030", bg = "none" })
vim.o.winborder = "single"

-- auto-close quickfix/gd buffer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.keymap.set("n", "<CR>", "<CR>:cclose<CR>", { buffer = true, silent = true })
	end,
})

-- adds border to diagnostic window (<leader>df)
vim.diagnostic.config({
	float = {
		border = "single",
	},
})

-- Toggles autoformatting
vim.api.nvim_create_user_command("FormatToggle", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
end, {
	desc = "Toggle autoformat-on-save",
})

-- Quits OpenCode
-- NOTE: This will quit ALL instances. Probably fine for now, but not ideal
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = vim.api.nvim_create_augroup("OpenCodeCleanup", { clear = true }),
	callback = function()
		vim.fn.jobstart("pkill -f opencode", { detach = true })
	end,
})
