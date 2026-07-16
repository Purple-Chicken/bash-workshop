typewrite "Welcome to the interactive shell tutor!"
typewrite "To exit this program, press <C-c> to quit at any time. "
sleep 2.5
typewrite "In UNIX, everything is a file."
typewrite "  - your text files";  typewrite "  - your images"; typewrite "  - your videos"; typewrite "  - your programs"; typewrite "Even your directories are stored as files!";
typewrite "Everything is stored in a text file if it can be. ";  typewrite "So, if you want to change the users, your program configs, or even system settings, there is always a file you can open in a text editor to change it!" 
typewrite "Throughout this demo, we will be doing operations within a pseudoshell. You will be able to only execute the command that you are explicitly told to execute."

# Setup environment in TUTOR_ROOT
cd "$TUTOR_ROOT"
echo "Blah blah blah here are some notes. " > notes.txt
echo "I hope nobody is reading this... " > .secretnotes.txt
mkdir stuff 2>/dev/null
touch stuff/stuff1.txt stuff/stuff2.txt stuff/stuff3.txt && echo "One stuff" > stuff/stuff1.txt ; echo "Two stuff" > stuff/stuff2.txt 
