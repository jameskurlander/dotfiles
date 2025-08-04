return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local util = require("lspconfig.util")

		--javascript, typescript, jsx, tsx, json, css, graphql, html
		lspconfig.biome.setup({
			cmd = function(dispatchers, config)
				local cmd = "biome"
				local local_cmd = (config or {}).root_dir and config.root_dir .. "/node_modules/.bin/biome"
				if local_cmd and vim.fn.executable(local_cmd) == 1 then
					cmd = local_cmd
				end
				return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
			end,
			filetypes = {
				"astro",
				"css",
				"graphql",
				"html",
				"javascript",
				"javascriptreact",
				"json",
				"jsonc",
				"svelte",
				"typescript",
				"typescript.tsx",
				"typescriptreact",
				"vue",
			},
			workspace_required = true,
			root_dir = function(fname)
				return util.root_pattern("biome.json", "biome.jsonc")(fname)
					or util.find_package_json_ancestor(fname)
					or util.find_node_modules_ancestor(fname)
					or util.find_git_ancestor(fname)
			end,
			-- root_dir = function(_, on_dir)
			-- 	-- To support monorepos, biome recommends starting the search for the root from cwd
			-- 	-- https://biomejs.dev/guides/big-projects/#use-multiple-configuration-files
			-- 	local cwd = vim.fn.getcwd()
			-- 	local root_files = { "biome.json", "biome.jsonc" }
			-- 	root_files = util.insert_package_json(root_files, "biome", cwd)
			-- 	local root_dir = vim.fs.dirname(vim.fs.find(root_files, { path = cwd, upward = true })[1])
			-- 	on_dir(root_dir)
			-- end,
		})
		-- vim.lsp.enable("biome")

		vim.lsp.enable("cssls")
		vim.lsp.enable("graphql")
		vim.lsp.enable("html")
		vim.lsp.enable("tailwindcss", {
			settings = {
				tailwindCSS = {
					experimental = {
						classRegex = {
							{ "([\"'`][^\"'`]*.*?[\"'`])", "[\"'`]([^\"'`]*).*?[\"'`]" },
						},
					},
				},
			},
		})

		--bash
		vim.lsp.enable("bashls")
		vim.lsp.enable("shfmt")
		vim.lsp.enable("shellcheck")

		-- c, c++
		vim.lsp.enable("clangd")
		vim.lsp.enable("clang-format")
		vim.lsp.enable("cpplint")

		--lua
		vim.lsp.enable("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		-- vim.lsp.enable("luacheck")
		-- vim.lsp.enable("stylua")

		--php
		-- vim.lsp.enable("blade_formatter");
		vim.lsp.enable("intelephense")
		vim.lsp.enable("phpactor", {
			filetypes = { "php", "blade" },
		})

		--other
		vim.lsp.enable("typos_lsp")
	end,
}
