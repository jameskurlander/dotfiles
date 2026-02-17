return {
	"NickvanDyke/opencode.nvim",
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			provider = {
				cmd = "pkill -f opencode; opencode --continue --port",
				enabled = "tmux",
			},
		}

		-- Required for `opts.events.reload`.
		vim.o.autoread = true
	end,
}
