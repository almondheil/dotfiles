-- see :h vimwiki_list for examples
local wiki = {
  path = '~/sync/Wiki',
  path_html = '~/download/wiki_html',
}

-- if you want to have multiple wikis, it will go
--
-- vim.g.vimwiki_list = {
--   wiki_1,
--   wiki_2,
--   ...
--   wiki_N,
-- }
vim.g.vimwiki_list = { wiki }

