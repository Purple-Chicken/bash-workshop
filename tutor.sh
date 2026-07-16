#!/usr/bin/env bash
# The first line of this script is the shebang which tells the system how to execute the script. 
# Comments start with <#>. The shebang is also a comment. 
# Below is a function you can ignore for now
export TUTOR_ROOT="$(pwd)/tutor"

trap 'echo -e "\nCleaning up workspace..."; rm -rf "$TUTOR_ROOT"' EXIT

mkdir -p "$TUTOR_ROOT"

function make_user_say ()
{
  local cmd="$*"
  local user_input=""
  local current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")
  typewrite "Now, type in '$cmd'"
  sleep 0.5
  read -p "[user@shelldemo $current_rel_dir]$ " user_input

  if [[ "$user_input" == $cmd ]]; then
    bash -c "$user_input"
  fi

  while [[ "$user_input" != "$cmd" ]]; do
    typewrite "Try again! Type in '$cmd'"
    sleep 0.5
    local current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")
    read -p "[user@shelldemo $current_rel_dir]$ " user_input
    if [[ "$user_input" == $cmd ]]; then
      bash -c "$user_input" 
      break
    fi
  done
  printf "%s" "[user@shelldemo $(pwd | sed "s/.*\/\(.*\)/\1/")]$ "
  sleep $linewait ; sleep $linewait 
  echo ""
} 
function demonstrate(){
  local cmd="$*"
  local current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")
  printf "[demo@shelldemo %s]$ " "$current_rel_dir"
  sleep $linewait
  typewrite "$cmd"
  eval "$cmd"
  printf "[demo@shelldemo %s]$ " "$current_rel_dir"
  sleep 1
  echo " "
}
# Function to add aesthetic typing
function typewrite (){
  local text="$*"
  local delay=0.01
  linewait=0.5
  for ((i = 0; i < ${#text}; i++)); do
    printf "%s" "${text:$i:1}"
    sleep $delay
  done
  echo
  sleep $linewait
}
clear
# load tutor modules

source "./tutor-modules/01-intro.sh"
source "./tutor-modules/02-ssh.sh"
source "./tutor-modules/03-navigation.sh"
source "./tutor-modules/04-files.sh"
source "./tutor-modules/05-path-traversal.sh"
source "./tutor-modules/06-file-ops.sh"
source "./tutor-modules/07-links.sh"
