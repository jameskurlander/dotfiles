return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local Layout = require("nui.layout")
    local Popup = require("nui.popup")
    local telescope = require("telescope")
    local TSLayout = require("telescope.pickers.layout")

    local function make_popup(options)
      local popup = Popup(options)
      function popup.border:change_title(title)
        popup.border.set_text(popup.border, "top", title)
      end

      return TSLayout.Window(popup)
    end

    telescope.setup({
      defaults = {
        preview = {
          msg_bg_fillchar = "¿?",
        },
        sorting_strategy = "ascending",
        disable_devicons = false,
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
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob",
          "!**/.git/*",
        },
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob",
          "!**/.git/*",
        },
        prompt_prefix = "@ ",
        selection_caret = "→ ",
        mappings = {
          i = {
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
        layout_strategy = "flex",
        layout_config = {
          full = {
            size = {
              width = "90%",
              height = "90%",
            },
          },
          mini = {
            size = {
              width = "90%",
              height = "90%",
            },
          },
        },
        create_layout = function(picker)
          local results = make_popup({
            focusable = false,
            border = {
              style = {
                top_left = "┌",
                top = "─",
                top_right = "┐",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              text = {
                top = false,
                top_align = "center",
              },
            },
          })

          local prompt = make_popup({
            enter = true,
            border = {
              style = {
                top_left = "┌",
                top = "─",
                top_right = "┐",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              text = {
                top = false,
                top_align = "center",
              },
            },
          })

          local preview = make_popup({
            focusable = false,
            border = {
              style = {
                top_left = "┌",
                top = "─",
                top_right = "┐",
                right = "│",
                bottom_right = "┘",
                bottom = "─",
                bottom_left = "└",
                left = "│",
              },
              text = {
                top = false,
                top_align = "center",
              },
            },
          })

          local box_by_kind = {
            full = Layout.Box({
              Layout.Box({
                Layout.Box(prompt, { size = 3 }),
                Layout.Box(results, { grow = 1 }),
              }, { dir = "col", size = "40%" }),
              Layout.Box(preview, { size = "61%" }),
            }, { dir = "row" }),
            mini = Layout.Box({
              Layout.Box(prompt, { size = 3 }),
              Layout.Box(results, { grow = 1 }),
            }, { dir = "col" }),
          }

          local function get_box()
            local width = vim.o.columns

            if width < 100 then
              return box_by_kind["mini"], "mini"
            end

            return box_by_kind["full"], "full"
          end

          local function get_layout_size(box_kind)
            return picker.layout_config[box_kind].size
          end

          local box, box_kind = get_box()
          local layout = Layout({
            relative = "editor",
            position = "50%",
            size = get_layout_size(box_kind),
          }, box)

          layout.picker = picker

          local layout_update = layout.update

          function layout:update()
            local box, box_kind = get_box()

            layout.results = results
            layout.prompt = prompt

            if box_kind == "mini" then
              layout.preview = nil
            else
              layout.preview = preview
            end

            layout_update(self, { size = get_layout_size(box_kind) }, box)
          end

          layout:update()

          return TSLayout(layout)
        end,
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
    })
  end,
}
