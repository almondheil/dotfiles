# aliases.fish - aliases to load

# always replace ls with ls --color=auto
function ls
	command ls --color=auto $argv
end

# other ls aliases can be much simpler, piggybacking off the --color=auto
function ll; ls -lh; end
function la; ls -a; end
function l.; ls -d .*; end

# shortenings and renamings
function cm; command chezmoi $argv; end
function cm_modify_manager; command chezmoi_modify_manager $argv; end
function note; command gonote $argv; end
function t; command todo.sh $argv; end
function open; command xdg-open $argv; end

# rm: prompt for recursive and >3 files
function rm
	command rm -I $argv
end

# rsync with options I use waaay too much
function prsync
	command rsync -rvh --info=progress2 $argv
end

# vimwiki
function wiki; nvim -c :VimwikiIndex; end
function today; nvim -c :VimwikiMakeDiaryNote; end

