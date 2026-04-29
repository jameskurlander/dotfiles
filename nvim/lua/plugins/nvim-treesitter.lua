return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    -- Enable highlighting and indentation
    vim.api.nvim_create_autocmd('FileType', {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    -- Install parsers
    local ensureInstalled = {
      'bash',
      'c',
      'c_sharp',
      'clojure',
      'comment',
      'cpp',
      'css',
      'dart',
      'elixir',
      'elm',
      'erlang',
      'fish',
      'fortran',
      'fsharp',
      'git_config',
      'git_rebase',
      'gitattributes',
      'gitignore',
      'gitcommit',
      'glsl',
      'go',
      'groovy',
      'groq',
      'graphql',
      'haskell',
      'html',
      'java',
      'javadoc',
      'javascript',
      'jsdoc',
      'json',
      'julia',
      'lua',
      'luadoc',
      'make',
      'markdown',
      'markdown_inline',
      'matlab',
      'nix',
      'objc',
      'ocaml',
      'pascal',
      'perl',
      'php',
      'phpdoc',
      'powershell',
      'printf',
      'prolog',
      'python',
      'r',
      'regex',
      'ruby',
      'rust',
      'scala',
      'solidity',
      'sql',
      'svelte',
      'swift',
      'tmux',
      'toml',
      'typescript',
      'tsx',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
      'zig',
      'zsh',
    }
    local alreadyInstalled = require('nvim-treesitter.config').get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser)
          return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
    require('nvim-treesitter').install(parsersToInstall)
  end,
}
