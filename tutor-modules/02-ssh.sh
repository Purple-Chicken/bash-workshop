clear
typewrite "Our first command will put us in the pseudoshell. Using SSH, we can get remote shell access to a computer, both in Windows and in Linux. The command goes as follows: "
printf "%s" "> "
sleep "0.5" 
typewrite "ssh demo@192.168.1.1"
sleep 2 
printf "[demo@remoteshell %s]$ " "$(pwd | sed "s/.*\/\(.*\)/\1/")"
sleep 1 
echo '^D'
clear 
typewrite "As you can see, we have ssh'ed into a remote machine using the ssh command. Try it out on your own!" 
user_input=""
  typewrite "Now, type in 'ssh user@192.168.1.1'"
  sleep 0.5
  read -p "> " user_input

  if [[ "$user_input" == 'ssh user@192.168.1.1' ]]; then
    sleep 2
    printf "[user@shelldemo %s]$ " "$(pwd | sed "s/.*\/\(.*\)/\1/")"
    sleep 1 
    echo '^D'
    clear 
  fi

  while [[ "$user_input" != 'ssh user@192.168.1.1' ]]; do
    typewrite "Try again! Type in 'ssh user@192.168.1.1'"
    sleep 0.5
    read -p "> " user_input
    if [[ "$user_input" == 'ssh user@192.168.1.1' ]]; then
      sleep 2
      printf "[user@shelldemo %s]$ " "$(pwd | sed "s/.*\/\(.*\)/\1/")"
      sleep 1 
      echo '^D'
      clear 
      break
    fi
  sleep 1
  echo " "
  done

