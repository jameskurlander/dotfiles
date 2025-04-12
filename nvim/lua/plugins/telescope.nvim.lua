return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        -- winblend = 5,
        file_ignore_patterns = {
          ".git/",
          "node_modules/",
          "vendor/",
          "target/",
          "%.jpg",
          "%.jpeg",
          "%.png",
          "%.gif",
          "%.webp",
          "%.zip",
          "%.tar",
          "%.gz",
          "%.bz2",
          "%.xz",
        },
        disable_devicons = false,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob", "!**/.git/*"
        },
        find_command = {
          'rg',
          '--files',
          '--hidden',
          '--glob', '!**/.git/*'
        },
        prompt_prefix = ' ',
        selection_caret = ' → ',
        mappings = {
          i = {
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end,
        },
      },
    });
  end,
}
