local o = vim.opt
local g = vim.g

-- turn off vi compatibility
o.compatible = false

-- numbering, both types
o.number = true
o.relativenumber = true

-- indentation: tab is 2 spaces by default
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

-- disable line wrap
o.wrap = false

-- highlight the current line
o.cursorline = true

-- enable color support
o.termguicolors = true

-- set formatoptions to control how line wrapping works in different contexts
o.formatoptions = 'qctlnj'
-- note: the default for vim is 'jcroql'

-- disable netrw, we will use vim-tree instead
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- chdir to the nearest dir to file, automatically
o.autochdir = true
