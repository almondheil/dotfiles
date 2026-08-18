# do not offer file completions (override per subcommand)
complete -c ftag --no-files

# version, help
complete -c ftag -s h -l help -d "Show help" --exclusive
complete -c ftag -l version -d "Show version" --exclusive

# -p
complete -c ftag -s p -d "Path to run from" -r --force-files

# count
complete -c ftag -n "__fish_use_subcommand" -a count -d "Count tracked files"

# -q / query
complete -c ftag -n "__fish_use_subcommand" -a query -d "Search for tags" -r
complete -c ftag -n "__fish_use_subcommand" -s q -d "Search for tags" -r

# -s / search
complete -c ftag -n "__fish_use_subcommand" -a search -d "Search for keywords in tags and descriptions" -r
complete -c ftag -n "__fish_use_subcommand" -s s -d "Search for keywords in tags and descriptions" -r

# -i / interactive
complete -c ftag -n "__fish_use_subcommand" -a interactive -d "Interactive mode" --exclusive
complete -c ftag -n "__fish_use_subcommand" -s i -d "Interactive mode" --exclusive

# check
complete -c ftag -n "__fish_use_subcommand" -a check -d "Check for missing files" --exclusive

# whatis
complete -c ftag -n "__fish_use_subcommand" -a whatis -d "Get tags for file"
complete -c ftag -n "__fish_seen_subcommand_from whatis" --force-files -r

# edit
complete -c ftag -n "__fish_use_subcommand" -a edit -d "Edit .ftag for a path"
complete -c ftag -n "__fish_seen_subcommand_from edit" --force-files

# clean
complete -c ftag -n "__fish_use_subcommand" -a clean -d "Clean up tags destructively" --exclusive

# untracked
complete -c ftag -n "__fish_use_subcommand" -a untracked -d "List files without tags" --exclusive

# tags
complete -c ftag -n "__fish_use_subcommand" -a tags -d "List tags" --exclusive
