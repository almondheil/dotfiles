# neovim as default editor
# set -gx == global, export
set -gx EDITOR "nvim"

# Extend the default $PATH to include personal locations
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.go/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.local/script"

# Load programming environments
## cargo
if test -f "$HOME/.cargo/env"
  source "$HOME/.cargo/env"
end
## go
set -gx GOPATH "$HOME/.go"
## ruby 😵‍💫
set -gx GEM_HOME "$HOME/.gems"

# file mask. 777 - 022 = 755, so rwxr-xr-x is the max perms
umask 022

if status is-interactive
  # only load these things for interactive shells
  # (keep it to visual stuff)

	# if there's <1 screen of context, make less go away
	set LESS "--no-init --quit-if-one-screen -R"
end
