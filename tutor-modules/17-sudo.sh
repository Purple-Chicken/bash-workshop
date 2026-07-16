typewrite "Most administrative tasks require 'root' privileges."
typewrite "The 'sudo' command lets you run a single command as root."

typewrite "The first thing a penetration tester checks is 'sudo -l'."
typewrite "This lists what commands the current user can run with sudo."
demonstrate "sudo -l"

typewrite "If you see '(ALL) NOPASSWD: ALL', the system is compromised."
typewrite "You can also use 'su' (Switch User) to become another user if you have their password."

typewrite "Now you try! Check your current user privileges with 'sudo -l'."
make_user_say "sudo -l"
sleep 1
