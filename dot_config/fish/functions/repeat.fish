function repeat --description 'Repeat a command N times' --argument-names n cmd
  function _usage
    echo "Usage: repeat N COMMAND"
  end

  argparse h/help -- $argv
  or { _usage; return 1 }

  if set -ql _flag_help
    _usage
    return 0
  end

  argparse --min-args 2 -- $argv
  or { _usage; return 1 }

	for i in (seq $n);
		echo "==> $i/$n <=="
		eval $cmd
	end
end
