return {
  'ThePrimeagen/harpoon',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local harpoon = require('harpoon')
    local mark = require('harpoon.mark')
    local ui = require('harpoon.ui')
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    harpoon.setup({})

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files) do
        table.insert(file_paths, item.filename)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        prompt_prefix = ' ',
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(_, map)
          map("i", "<C-d>", function(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            if selection then
              require('harpoon.mark').rm_file(selection[1])
              actions.close(prompt_bufnr)
              toggle_telescope(harpoon.get_mark_config().marks)
            end
          end)
          return true
        end,
      }):find()
    end

    vim.keymap.set("n", "<leader>hh", function()
      toggle_telescope(require('harpoon').get_mark_config().marks)
    end, { desc = "Open Harpoon window with Telescope" });
    vim.keymap.set("n", "<leader>ha", function() mark.add_file() end, { desc = "Add file to Harpoon" });
    vim.keymap.set("n", "<leader>hd", function() mark.rm_file() end, { desc = "Remove file from Harpoon" });
    vim.keymap.set("n", "<leader>hc", function() mark.clear_all() end, { desc = "Clear all files from Harpoon" });
    vim.keymap.set("n", "<C-p>", function() ui.nav_prev() end, { desc = "Navigate to previous Harpoon file" })
    vim.keymap.set("n", "<C-n>", function() ui.nav_next() end, { desc = "Navigate to next Harpoon file" })
  end
}
