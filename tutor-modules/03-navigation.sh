cd "$TUTOR_ROOT"
# Module Setup
echo "Blah blah blah here are some notes. " > notes.txt
echo "I hope nobody is reading this... " > .secretnotes.txt
mkdir -p stuff
echo "One stuff" > stuff/stuff1.txt

typewrite "Now that we're in, we need situational awareness."
typewrite "The first question an investigator asks is: 'Where am I?'"

typewrite "The 'pwd' (Print Working Directory) command tells us our current location."
demonstrate "pwd"

typewrite "Now you try. Check your current location."
make_user_say "pwd"

typewrite "Alright, now we know where we are in the filesystem. But, what is in our current directory?"
typewrite "We can use 'ls' to list the stuff in our current directory. Let me show you."
demonstrate "ls"

typewrite "Now it's your turn!"
make_user_say "ls"

typewrite "You can see we have several files and folders in this directory."
typewrite "For a security professional, just the names aren't enough. We need metadata: permissions, owners, and sizes."
typewrite "We can use 'ls -l' for the 'long' format to see this extra info. Let me show you."

demonstrate "ls -l"

typewrite "See the extra columns? We will decode those later. Your turn!"
make_user_say "ls -l"
sleep 3
