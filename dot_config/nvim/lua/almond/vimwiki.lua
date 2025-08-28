-- example wiki definition. 
-- see :h vimwiki_list for more
--
-- local mywiki = {
--   path = '/path/to/wiki',
-- }

local notes = {
  path = '~/sync/Notes/',
  syntax = 'markdown',
  ext = 'md',
}

local wiki = {
  -- set directories to be used
  path = '~/sync/wiki',
  path_html = '~/download/wiki_html',

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

