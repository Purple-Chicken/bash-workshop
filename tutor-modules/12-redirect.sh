cd "$TUTOR_ROOT"
# Ensure we have some files for ls
touch notes.txt access.log 2>/dev/null

typewrite "In the CLI, every command has three 'streams':"
typewrite "1. Standard Input (stdin) - where data comes from (keyboard)."
typewrite "2. Standard Output (stdout) - where normal data goes (screen)."
typewrite "3. Standard Error (stderr) - where error messages go."

typewrite "We can 'redirect' these streams to files using '>' and '>>'."
typewrite "'>' overwrites a file, while '>>' appends to the end of it."

typewrite "Let's save a list of files to an evidence file."
demonstrate "ls -l > evidence_list.txt"
demonstrate "cat evidence_list.txt"

typewrite "Now, let's append a timestamp to that same file."
demonstrate "date >> evidence_list.txt"
demonstrate "tail -n 1 evidence_list.txt"

typewrite "Sometimes, commands produce errors we don't want to see."
typewrite "We can redirect stderr (stream 2) to /dev/null—the Linux 'black hole'."
demonstrate "find /root -name secret 2> /dev/null"

typewrite "Now you try! Redirect the output of 'pwd' to a new file called 'location.txt'."
make_user_say "pwd > location.txt"

typewrite "Now, append the text 'Investigation started' to 'location.txt'."
make_user_say "echo 'Investigation started' >> location.txt"
sleep 1
