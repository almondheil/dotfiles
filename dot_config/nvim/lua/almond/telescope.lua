require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Keymappings for telescope, under <leader>f
local builtin = require('telescope.builtin')
local keymap = vim.keymap.set
keymap('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
keymap('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
keymap('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
keymap('n', '<leader>fh', builtin.help_tags, { desc = "Help tags" })
-- LSP-related searches
keymap('n', '<leader>fd', builtin.lsp_definitions, { desc = "Find definitions" })
keymap('n', '<leader>fr', builtin.lsp_references, { desc = "Find references" })
