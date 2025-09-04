-- before plugins load, set up vimwiki global vars
require('almond.options')
require('almond.vimwiki')

--- lazy.nvim, snazzy plugin manager
require('almond.lazy')

--- load individual plugins config after load. order matters here
require('almond.treesitter')
require('almond.lsp')
require('almond.completion')
require('almond.explorer')
require('almond.telescope')
require('almond.whichkey')
