# set file mask
umask 022

# if there's <1 screen of context, make less go away
set LESS "--no-init --quit-if-one-screen -R"

# rm: prompt for recursive and >3 files
function rm
	command rm -I $argv
end

# rsync with options I use waaay too much
function prsync
	command rsync -rvh --info=progress2 $argv
end

# list files
function ls
	# command ensures we don't eval any functions called ls (aka a loop)
	command ls --color=auto $argv
end
function ll
	ls -lh $argv
end
function la
	ls -a $argv
end
