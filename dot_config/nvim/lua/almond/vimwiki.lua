-- disable URL hiding
vim.g.vimwiki_url_maxsave = 0

-- when opening `dir/`, open/create `dir/main` instead
vim.g.vimwiki_dir_link = 'main'

-- one wiki definition. 
-- see :h vimwiki_list for more
local notes = {
  path = '~/sync/Notes/',
  syntax = 'markdown',
  ext = 'md',
}

local wiki = {
  -- set directories to be used
  path = '~/sync/wiki',
  path_html = '~/download/wiki_html',

  -- make wiki base page named main, not index
  index = 'main',

  -- update tag metadata on file save so you don't have to do it manually
  -- :VimwikiSearchTags to search, <C-X><C-O> in normal mode to omni complete :tags:
  auto_tags = 1,
}

-- if you want to have multiple wikis, it will go
--
-- vim.g.vimwiki_list = {
--   wiki_1,
--   wiki_2,
--   ...
--   wiki_N,
-- }
vim.g.vimwiki_list = {
  wiki,
  notes,
}

-- creating new wiki file: call template script
vim.api.nvim_create_autocmd({'BufNewFile'}, {
  pattern = '*.wiki',
  command = "0r! ~/.local/script/vimwiki-template.py '%'",
})

-- editing all wiki files: text width 100
vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  pattern = '*.wiki',
  command = 'setlocal textwidth=100',
})
