--- general settings that should be set before plugins load
require('almond.basic')
require('almond.vimwiki')
--require('almond.keymaps')

--- lazy.nvim, snazzy plugin manager
require('almond.lazy')

--- load individual plugins. order matters
require('almond.treesitter')
require('almond.lsp')
require('almond.completion')
require('almond.explorer')
require('almond.telescope')
require('almond.whichkey')
require('almond.theme') -- theme should go last

-- visuals
require('almond.theme')
---require('almond.statusline')
