#!/usr/bin/env bash

# Global Environment Setup
export TUTOR_ROOT="$(pwd)/tutor"
TUTOR_MODULES="$(pwd)/tutor-modules"
export IN_COMMAND=0 
export pagewait=5 
export linewait=2
# Cleanup on exit
trap 'echo -e "\nCleaning up workspace..."; rm -rf "$TUTOR_ROOT"' EXIT
trap 'if [[ $IN_COMMAND -eq 0 ]]; then echo -e "\n[!] Exiting Tutor..."; exit 1; else echo ""; fi' INT

mkdir -p "$TUTOR_ROOT"
cd "$TUTOR_ROOT" || exit

# Helper Functions
function run_cmd() {
  IN_COMMAND=1       # Tell the trap a command is running
  eval "$1"          # Execute the command
  IN_COMMAND=0       # Tell the trap we are idle again
}

function make_user_say () {
  local cmd="$*"
  local user_input=""
  local current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")
  [[ "$current_rel_dir" == "." ]] && current_rel_dir="~"
  typewrite "Now, type in '$cmd'"
  sleep 0.5
  read -p "[user@shelldemo $current_rel_dir]$ " user_input
  # Allow 'cd' or 'cd ~' as valid inputs for 'cd $TUTOR_ROOT'
  if [[ "$user_input" == "$cmd" ]]; then
    if [[ "$user_input" == "cd" || "$user_inpput" == "cd ~" ]]; then eval "cd $TUTOR_ROOT" 
    else
      run_cmd "$user_input"
    fi
  fi

  while [[ "$user_input" != "$cmd" ]]; do
    if [[ "$user_input" =~ ^.*ls.*$ ]]; then
      run_cmd "$user_input"
      typewrite "Now that you know what is in this directory, try again!"
    elif [[ "$user_input" == "cd"  || "$user_input" == "cd ~" ]]; then 
      run_cmd "cd $TUTOR_ROOT"
      typewrite "Now that you are in the tutor directory, try again!"
    elif [[ "$user_input" =~ ^.*cat.*$ ]]; then
      run_cmd "$user_input"
      typewrite "Now that you know the contents of the file, try again!"
    elif [[ "$user_input" =~ ^pwd$ ]]; then 
      run_cmd "$user_input"
      typewrite "Now that you know the current working directory, try again!"
    else
      typewrite "Try again!"
    fi
      typewrite "Type in: '$cmd'"
      sleep 0.5
      local current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")
      [[ "$current_rel_dir" == "." ]] && current_rel_dir="~"
      read -p "[user@shelldemo $current_rel_dir]$ " user_input
      if [[ "$user_input" == $cmd ]]; then
        run_cmd "$user_input" 
        break
      fi
  done
  echo ""
}

function demonstrate(){
  local cmd="$*"
  local current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")
  [[ "$current_rel_dir" == "." ]] && current_rel_dir="~"
  
  printf "[demo@shelldemo %s]$ " "$current_rel_dir"
  sleep 0.5
  typewrite "$cmd"
  run_cmd "$cmd"
  current_rel_dir=$(realpath --relative-to="$TUTOR_ROOT" "$(pwd)")  
  printf "[demo@shelldemo %s]$ " "$current_rel_dir"
  sleep 1
  echo -e "\n"
}

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

# Phase 1: Foundations
source "$TUTOR_MODULES/01-intro.sh"
source "$TUTOR_MODULES/02-ssh.sh"
source "$TUTOR_MODULES/03-navigation.sh"
source "$TUTOR_MODULES/04-traversal.sh"
source "$TUTOR_MODULES/05-reading.sh"
source "$TUTOR_MODULES/06-file-ops.sh"
source "$TUTOR_MODULES/07-links.sh"

# Phase 2: Discovery & Intelligence
source "$TUTOR_MODULES/08-help.sh"
source "$TUTOR_MODULES/09-discovery.sh"
source "$TUTOR_MODULES/10-wildcards.sh"
source "$TUTOR_MODULES/11-adv-find.sh"
source "$TUTOR_MODULES/11.5-binary-triage.sh"

# Phase 3: The Data Pipeline
source "$TUTOR_MODULES/12-redirect.sh"
source "$TUTOR_MODULES/13-piping.sh"
source "$TUTOR_MODULES/14-parsing.sh"
source "$TUTOR_MODULES/15-adv-regex.sh"
source "$TUTOR_MODULES/15.5-hashing-iocs.sh"

# Phase 4: Governance & Auditing
source "$TUTOR_MODULES/16-permissions.sh"
source "$TUTOR_MODULES/17-sudo.sh"
source "$TUTOR_MODULES/18-env-variables.sh"
source "$TUTOR_MODULES/19-processes.sh"
source "$TUTOR_MODULES/19.5-user-activity.sh"

# Phase 5: Network, Persistence & Evidence
source "$TUTOR_MODULES/20-network.sh"
source "$TUTOR_MODULES/20.5-dns-pcap.sh"
source "$TUTOR_MODULES/21-transfer.sh"
source "$TUTOR_MODULES/22-auditing.sh"
source "$TUTOR_MODULES/23-evidence-handling.sh"
