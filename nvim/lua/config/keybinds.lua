local settings = { noremap = true, silent = true }

-- Lazy
vim.keymap.set("n", "<leader>lz", ":Lazy<CR>", settings)

-- LazyGit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>", settings)

-- LazyDocker
vim.keymap.set("n", "<leader>ld", ":Lazydocker<CR>", settings)

-- Leap
vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap)")
vim.keymap.set("n", "S", "<Plug>(leap-from-window)")

-- LSP
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)

vim.diagnostic.config({
	virtual_text = true,
	underline = false,
	signs = true,
	update_in_insert = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Neovim
vim.keymap.set("n", "<leader>ch", ":checkhealth<CR>", settings)

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

-- Octo
vim.keymap.set("n", "<leader>ors", ":Octo review start<CR>", settings)
vim.keymap.set("n", "<leader>orf", ":Octo review submit<CR>", settings)
vim.keymap.set("n", "<leader>orr", ":Octo review resume<CR>", settings)
vim.keymap.set("n", "<leader>ord", ":Octo review discard<CR>", settings)
vim.keymap.set("n", "<leader>orp", ":Octo review comments<CR>", settings)
vim.keymap.set("n", "<leader>orc", ":Octo review close<CR>", settings)

vim.keymap.set("n", "<leader>oca", ":Octo comment add<CR>", settings)
vim.keymap.set("n", "<leader>ocd", ":Octo comment delete<CR>", settings)
vim.keymap.set("n", "<leader>ocn", ":Octo unresolve<CR>", settings)
vim.keymap.set("n", "<leader>ocp", ":Octo thread unresolve<CR>", settings)

vim.keymap.set("n", "<leader>otr", ":Octo thread resolve<CR>", settings)
vim.keymap.set("n", "<leader>otu", ":Octo thread unresolve<CR>", settings)

-- Opencode
local opencode = require("opencode")

function OpencodeAsk()
	opencode.ask("@this: ", { submit = true })
end

function OpencodePageUp()
	opencode.command("session.page.up")
end

function OpencodePageDown()
	opencode.command("session.page.down")
end

function OpencodeScrollBottom()
	opencode.command("session.last")
end

function OpencodeNewSession()
	opencode.command("session.new")
end

function OpencodeListSessions()
	opencode.command("session.list")
end

function OpencodeSelect()
	opencode.select()
end

function OpencodeToggle()
	opencode.toggle()
end

vim.keymap.set({ "n", "x" }, "<leader>aa", OpencodeAsk, { desc = "Ask opencode" })

function OpencodeDiagnostics()
	require("opencode").ask("Show diagnostics for this file", { submit = true })
end

vim.keymap.set("n", "<leader>ad", OpencodeDiagnostics, { desc = "Opencode diagnostics" })
vim.keymap.set({ "n", "x" }, "<leader>as", OpencodeSelect, { desc = "Select opencode action" })

vim.keymap.set({ "n", "t" }, "\\", OpencodeToggle, { desc = "Toggle opencode buffer" })
vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>w]], { desc = "Exit opencode buffer" })

vim.keymap.set({ "n", "t" }, "<C-j>", OpencodePageDown, { desc = "Scroll opencode page down" })
vim.keymap.set({ "n", "t" }, "<C-k>", OpencodePageUp, { desc = "Scroll opencode page up" })
vim.keymap.set({ "n", "t" }, "<C-g>", OpencodeScrollBottom, { desc = "Scroll opencode to bottom" })

vim.keymap.set("t", "<C-r>", OpencodeNewSession, { desc = "Start new opencode session" })
vim.keymap.set("t", "<C-l>", OpencodeListSessions, { desc = "List opencode sessions" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fc", builtin.git_commits, {})

-- UndoTree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, settings)

-- Vim
vim.keymap.set("n", "<leader>w", ":wa!<CR>", settings)
vim.keymap.set("n", "<leader>q", ":qa!<CR>", settings)
vim.keymap.set("n", "<leader>df", function()
	vim.diagnostic.open_float(nil, {
		scope = "line",
		focus = false,
		border = "single",
	})
end, settings)

-- Vim-Fugitive
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", settings)
-- vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", settings)
