--- general settings
require('core.options')
--require('core.keymaps')

--- lazy.nvim, snazzy plugin manager
require('core.lazy')

--- load individual plugins. order matters
require('core.treesitter')
require('core.lsp')
require('core.completion')
require('core.explorer')
require('core.telescope')
require('core.whichkey')
require('core.theme')

-- visuals
require('core.theme')
---require('core.statusline')
