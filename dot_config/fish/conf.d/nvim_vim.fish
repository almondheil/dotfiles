# neovim as default editor
# set -gx == global, export
set -gx EDITOR "nvim"

# type vim, not nvim
abbr --add -- vim nvim

# vimwiki utils
function wiki; nvim -c :VimwikiIndex; end
function today; nvim -c :VimwikiMakeDiaryNote; end
