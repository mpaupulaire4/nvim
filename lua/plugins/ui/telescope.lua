return {
  "nvim-telescope/telescope.nvim",
  version = "0.1.0",
  dependencies = {
    { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" },
    "kyazdani42/nvim-web-devicons",
  },
  cmd = "Telescope",
  keys = {
    { "<leader>fb", "<cmd>Telescope buffers<CR>" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>" },
    { "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>" },
    { "<leader>fw", "<cmd>Telescope live_grep<CR>" },
    { "<leader>fo", "<cmd>Telescope oldfiles<CR>" },
    { "<leader>fm", "<cmd>Telescope marks<CR>" },

    -- LSP related
    { "gd", "<cmd>Telescope lsp_definitions<cr>" },
    { "gr", "<cmd>Telescope lsp_references<cr>" },
    { "<leader>da", "<cmd>Telescope diagnostics<cr>" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>" },
  },
  config = function()
    local actions = require("telescope.actions")
    local telescope = require("telescope")

    telescope.setup {
      defaults = {
        mappings = {
          i = {
            ["<C-e>"] = actions.close,
            ["<Esc>"] = actions.close,
            ["<C-c>"] = actions.delete_buffer,
          },
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 10,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },
      pickers = {
        find_files = {
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
        lsp_code_actions = {
          theme = 'cursor'
        },
        lsp_definitions = {
          theme = 'cursor'
        },
        diagnostics = {
          theme = 'dropdown',
          layout_config = {
            preview_cutoff = 1, -- Preview should always show (unless previewer = false)
            anchor = "N",
            -- mirror = true,
            width = function(_, max_columns, _)
              return math.min(max_columns, 120)
            end,

            height = function(_, _, max_lines)
              return math.min(max_lines, 15)
            end,
          },
        }
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      }
    }

    local extensions = { "notify", "persisted" }
    for _, ext in ipairs(extensions) do
      pcall(function()
        telescope.load_extension(ext)
      end)
    end

  end
}
