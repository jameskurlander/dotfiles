return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("mason").setup({
			ui = {
				border = "single",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				--bash
				"bashls",
				-- "shfmt",
				-- "shellcheck",

				-- c, c++
				"clangd",

				--javascript, typescript, jsx, tsx, json, css, graphql, html
				"biome",
				"cssls",
				"graphql",
				"html",
				"tailwindcss",

				--lua
				"lua_ls",
				-- "luacheck",
				-- "stylua",

				--php
				-- "blade-formatter",
				"intelephense",
				"phpactor",

				--other
				"typos_lsp",
			},
		})
	end,
}
