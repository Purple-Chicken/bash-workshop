cd "$TUTOR_ROOT"
typewrite "Who has been on your system? Use 'last' to see recent logins."
# Note: 'last' might be empty in some environments, but we'll try
demonstrate "last | head -n 5"

typewrite "Use 'w' to see who is logged in RIGHT NOW and what they are doing."
demonstrate "w"

typewrite "Finally, '.bash_history' is a goldmine for investigators."
typewrite "It records every command a user has typed."
demonstrate "tail -n 5 ~/.bash_history 2>/dev/null || history | tail -n 5"

typewrite "Now you try! Check who is currently logged in with 'w'."
make_user_say "w"
sleep 1
