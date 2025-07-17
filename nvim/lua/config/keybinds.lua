local settings = { noremap = true, silent = true }

-- LazyGit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", settings)

-- LazyDocker
vim.keymap.set("n", "<leader>ld", ":Lazydocker<CR>", settings)

-- Vim
vim.keymap.set("n", "<leader>th", ":set hlsearch!<CR>", settings)
vim.keymap.set("n", "<leader>w", ":wa!<CR>", settings)
vim.keymap.set("n", "<leader>q", ":qa!<CR>", settings)
vim.keymap.set("n", "<leader>df", function()
	vim.diagnostic.open_float(nil, {
		scope = "line",
		focus = false,
		border = "single",
	})
end, settings)

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, settings)

-- Vim-Fugitive
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", settings)
-- vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", settings)

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})

-- Obsidian
-- vim.keymap.set("n", "<leader>og", ":ObsidianSearch<CR>", settings)
-- vim.keymap.set("n", "<leader>oo", ":ObsidianQuickSwitch<CR>", settings)
-- vim.keymap.set("n", "<leader>on", ":ObsidianNew<CR>", settings)
-- vim.keymap.set("n", "<leader>or", ":ObsidianRename<CR>", settings)
-- vim.keymap.set("n", "<leader>ow", ":ObsidianWorkspace<CR>", settings)
-- vim.keymap.set("n", "<leader>oll", ":ObsidianLinks<CR>", settings)
-- vim.keymap.set("v", "<leader>oe", ":ObsidianExtractNote<CR>", settings)
-- vim.keymap.set("v", "<leader>oln", ":ObsidianLinkNew<CR>", settings)
-- vim.keymap.set("v", "<leader>ole", function()
-- 	local link_text = vim.fn.input("Note Name")
-- 	vim.cmd("ObsidianLink " .. link_text)
-- end, { noremap = true, silent = true })

-- LSP
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>df", vim.diagnostic.open_float)
vim.keymap.set("n", "<space>dl", vim.diagnostic.setloclist)
vim.diagnostic.config({
	virtual_text = true,
	underline = false,
	signs = true,
	update_in_insert = false,
})

-- Octo
vim.keymap.set("n", "<leader>ors", ":Octo review start<CR>", settings)
vim.keymap.set("n", "<leader>orf", ":Octo review submit<CR>", settings)
vim.keymap.set("n", "<leader>orr", ":Octo review resume<CR>", settings)
vim.keymap.set("n", "<leader>ord", ":Octo review discard<CR>", settings)
vim.keymap.set("n", "<leader>orp", ":Octo review comments<CR>", settings)
vim.keymap.set("n", "<leader>orc", ":Octo review close<CR>", settings)
vim.keymap.set("n", "<leader>oca", ":Octo comment add<CR>", settings)
vim.keymap.set("n", "<leader>ocd", ":Octo comment delete<CR>", settings)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		-- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})
