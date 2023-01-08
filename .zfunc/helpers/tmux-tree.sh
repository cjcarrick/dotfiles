IFS=$'\n' 

BOLD=$(tput bold)
RED='\033[0;31m'
CYAN='\033[0;36m'
RESET='\033[0m' # No Color

# $1 is the window_id of the window to get the panes of
#
# $2 should be set to 1 if this is the last window
function window_tree() {
  printf "$RESET"
  PANE_INFOS=( $( tmux list-panes -t "$1" -F "#{pane_index}: #{pane_current_command} (PID #{pane_pid})") )

  for (( j=0; j < ${#PANE_INFOS[@]}; j++ )); do

    if [[ $2 ]]; then
      printf "  "
    else
      printf " ┃"
    fi

    if [[ $(( $j + 1 )) == ${#PANE_INFOS[@]} ]]; then
      printf "   └── "
    else
      printf "   ├── "
    fi

    echo "${PANE_INFOS[$j]}"

  done
}


function session_tree() {
  WINDOW_IDS=( $( tmux list-windows -t "$1" -F '#{window_id}' ) )
  WINDOW_INFOS=( $( tmux list-windows -t "$1" -F '#{window_name} [#{window_flags}]' ) )

  for((i=0; i < "${#WINDOW_IDS[@]}"; i++)); do

    printf "$BOLD"
    if [[ $(( $i + 1 )) == ${#WINDOW_INFOS[@]} ]]; then
      echo " ┗━━ $i: ${WINDOW_INFOS[$i]}"
      window_tree "${WINDOW_IDS[$i]}" 1
    else
      echo " ┣━━ $i: ${WINDOW_INFOS[$i]}"
      window_tree "${WINDOW_IDS[$i]}"
    fi

  done
}

SESSION_IDS=( $(tmux list-sessions -F '#{session_id}') )
SESSION_NAMES=( $(tmux list-sessions -F '#{session_name}') )

for(( n=0; n < ${#SESSION_IDS[@]}; n++ )); do

  if [[ $(( $n + 1 )) == ${#SESSION_IDS[@]} ]]; then
    echo ""
  fi

  printf "$BOLD"
  if [[ "$1" == "${SESSION_NAMES[$n]}" ]]; then
    printf "$CYAN$BOLD" 
  fi
  echo "${SESSION_NAMES[$n]}"
  printf "$RESET"

  session_tree "${SESSION_IDS[$n]}"
done
