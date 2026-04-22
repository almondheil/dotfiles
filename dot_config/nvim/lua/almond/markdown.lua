require('nvim-mdlink').setup({
  keymap = true,
  cmp = true
})

-- set options when opening *.md
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  pattern = '*.md',
  command = 'setlocal wrap linebreak',
})
