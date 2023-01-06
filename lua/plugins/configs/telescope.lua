local present, telescope = pcall(require, "telescope")

if not present then
  return
end

local actions = require("telescope.actions")

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
    termfinder = {
      mappings = {
        rename_term = '<C-r>',
        delete_term = '<C-c>',
        vertical_term = '<C-v>',
        horizontal_term = '<C-h>',
        float_term = '<C-f>'
      }
    }
  }
}

local extensions = { "notify", "persisted" }

pcall(function()
  for _, ext in ipairs(extensions) do
    telescope.load_extension(ext)
  end
end)


local map = require('core.utils').map
map("n", "<leader>fb", "<cmd>Telescope buffers <CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files <CR>")
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags <CR>")
map("n", "<leader>fw", "<cmd>Telescope live_grep <CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles <CR>")
map("n", "<leader>ft", "<cmd>Telescope termfinder find <CR>")

-- LSP related
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
map("n", "gr", "<cmd>Telescope lsp_references<cr>")
map("n", "<leader>da", "<cmd>Telescope diagnostics<cr>")
map("n", "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>")
