cd "$TUTOR_ROOT"
typewrite "The Environment defines how your shell behaves."
typewrite "The '$PATH' variable tells the shell where to look for commands."
typewrite "If an attacker can add their directory to the START of your $PATH, they can hijack commands."

typewrite "Another trick is using 'alias' to mask malicious activity."
typewrite "An attacker might alias 'ls' to hide their presence."
demonstrate "alias ls='ls --color=always && echo \"[WARNING] ATTACKER SCRIPT RUNNING\"'"
demonstrate "ls"

typewrite "To fix this, you can use 'unalias' or run the command with its full path."
demonstrate "unalias ls"

typewrite "Now you try! Create an alias named 'check' that runs 'ls -la'."
make_user_say "alias check='ls -la'"
make_user_say "check"
sleep 1
