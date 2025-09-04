local vim_global = vim.g

-- disable URL hiding
vim_global.vimwiki_url_maxsave = 0

-- when opening `dir/`, open/create `dir/main` instead
vim_global.vimwiki_dir_link = 'main'

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
vim_global.vimwiki_list = {
  wiki,
  notes,
}

