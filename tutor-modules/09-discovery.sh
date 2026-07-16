cd "$TUTOR_ROOT"
# Ensure the log file exists for discovery
touch access.log 2>/dev/null

typewrite "Now let's talk about finding things. Sometimes you know a tool exists, but you don't know where it's stored."
typewrite "The 'which' command shows you the path of the binary that runs when you type a command name."
demonstrate "which ls"

typewrite "Similarly, 'whereis' gives you even more info, like where the source code or manual pages are."
demonstrate "whereis ls"

typewrite "But what if you're looking for a specific file? For that, we use 'find'."
typewrite "'find' is incredibly powerful. The basic syntax is: 'find [where to look] -name [what to look for]'."

typewrite "Let's try to find our 'access.log' file starting from our current directory ('.')."
demonstrate "find . -name access.log"

typewrite "Now you try! Use 'which' to find out where the 'cat' command is located."
make_user_say "which cat"

typewrite "Now, try to find any file named 'malware.sh' in the current directory."
make_user_say "find . -name malware.sh"
sleep 1
