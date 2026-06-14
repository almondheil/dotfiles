function fish_greeting
  echo "\
   --------------
   |            |
   | /\-/\/\-/\ | $(set_color -i)*despite everything, it's still you$(set_color --reset)
   |/( - (     \|
   ------/      -
"
  echo $(set_color yellow)Top 5 TODOs:$(set_color --reset)
  todo.sh ls | head -n 5
end
