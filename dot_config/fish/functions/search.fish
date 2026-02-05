function search --description 'Match words in any order'
  function _usage 
    echo "Usage: search 'list of words' [DIR...]"
  end

  # try to parse args
  argparse h/help v/verbose -- $argv
  or { _usage; return 1 }

  # give help if they want it (before checking number of args)
  if set -ql _flag_help
    _usage; return
  end

  # make sure min args are met
  argparse --min-args 1 -- $argv
  or { _usage; return 1 }

  # get search terms the user wants
  set -f terms (string split ' ' $argv[1])
  set -f n_terms (count $terms)

  # construct a regex with lookahead
  set -f regex ""
  for i in (seq 1 $n_terms)
    set -l term $terms[$i]
    set -f regex "$regex(?=.*\b$term\b)"
  end
  set -f regex "$regex.+"

  # put that regex into a big ripgrep command
  set -f args "--ignore-case --color=never --pcre2"
  set -f dirs "$argv[2..]"
  set -f search_command "rg $args -- '$regex' $dirs"

  # eval search command, printing if --verbose is on
  if set -ql _flag_verbose
    echo "$search_command"
  end
  eval $search_command
end
