return {
  "NickvanDyke/opencode.nvim",
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      provider = {
        enabled = "tmux",
      },
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true
  end,
}
