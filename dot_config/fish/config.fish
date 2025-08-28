if status is-interactive
	# Commands to run in interactive sessions can go here

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
	set GOPATH "$HOME/.go"
	## ruby 😵‍💫
	set GEM_HOME "$HOME/.gems"

	# file mask. 777 - 022 = 755, so rwxr-xr-x is the max perms
	umask 022

	# neovim as default editor
	set EDITOR "nvim"

	# if there's <1 screen of context, make less go away
	set LESS "--no-init --quit-if-one-screen -R"
end
