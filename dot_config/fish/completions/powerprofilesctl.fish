function _list_actions
  powerprofilesctl list-actions | grep Name | cut -d ' ' -f 2
end
function _list_profiles
  powerprofilesctl list | grep -e '^  [a-z]' -e '^*' | tr -d '* :'
end

# options that apply everywhere
complete -c powerprofilesctl -s "h" -l "help" -d "Show help"
complete -c powerprofilesctl --no-files

# define available subcommands
complete -c powerprofilesctl -n "__fish_use_subcommand" -a list -d "List available power profiles"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a list-holds -d "List current power profile holds"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a list-actions -d "List available power profile actions"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a get -d "Print the currently active power profile"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a set -d "Set the currently active power profile"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a configure-action -d "Configure the action to be taken for the profile"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a configure-battery-aware -d "Turn on or off dynamic changes from battery level or power adapter"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a query-battery-aware -d "Query if dynamic changes from battery level or power adapter are enabled"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a launch -d "Launch a command while holding a power profile"
complete -c powerprofilesctl -n "__fish_use_subcommand" -a version -d "Print version information and exit"

# set
complete -c powerprofilesctl -n "__fish_seen_subcommand_from set" -ra "$(_list_profiles)"

# configure-action
complete -c powerprofilesctl -n "__fish_seen_subcommand_from configure-action" -l enable -d "Enable action"
complete -c powerprofilesctl -n "__fish_seen_subcommand_from configure-action" -l disable -d "Disable action"
complete -c powerprofilesctl -n "__fish_seen_subcommand_from configure-action" -ra "$(_list_actions)"

# configure-battery-aware
complete -c powerprofilesctl -n "__fish_seen_subcommand_from configure-battery-aware" -l enable -d "Enable battery-aware changes"
complete -c powerprofilesctl -n "__fish_seen_subcommand_from configure-battery-aware" -l disable -d "Disable battery-aware changes"

# launch
complete -c powerprofilesctl -n "__fish_seen_subcommand_from launch" -s p -l profile -ra "$(_list_profiles)" -d "Power profile to use for launch"
complete -c powerprofilesctl -n "__fish_seen_subcommand_from launch" -s r -l reason -r -d "Reason to use for launch"
complete -c powerprofilesctl -n "__fish_seen_subcommand_from launch" -s i -l appid -r -d "AppId to use for launch"
complete -c powerprofilesctl -n "__fish_seen_subcommand_from launch" --force-files
