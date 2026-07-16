typewrite "To find evidence, you must know how to move through the system's branches."
typewrite "We use the 'cd' command to change our working directory."
typewrite "There are two ways to tell the shell where to go: Absolute paths and Relative paths."
typewrite "A Relative path is like saying 'go to the kitchen' when you are already in the house."
typewrite "An Absolute path is like giving the full GPS coordinates from the start of the earth."

# Setup nested directories for demonstration
cd "$TUTOR_ROOT"
mkdir -p logs/web/apache 2>/dev/null
echo "Log evidence found here!" > logs/web/apache/access.log

typewrite "Let's try moving into the 'logs/web' directory using a relative path. Watch how the prompt changes:"
demonstrate "cd logs/web"
typewrite "Now, let's go back to where we were by using '..' , which represents the parent directory. Here is how it looks: "
demonstrate "cd .."
cd "$TUTOR_ROOT"
typewrite "Now you try it! Move into 'logs/web' using a relative path."
make_user_say "cd logs/web"

typewrite "Great! Now, let's use an Absolute path to jump straight to the apache logs."
typewrite "Absolute paths always start with a '/', which represents the root of the entire system."
typewrite "In this workshop, your root is $TUTOR_ROOT."
make_user_say "cd $TUTOR_ROOT/logs/web/apache"

typewrite "Notice how we jumped across multiple levels at once? That's the power of absolute paths."
typewrite "Finally, move back to our home base. You can type the full path 'cd $TUTOR_ROOT', or just type 'cd' which always takes you home."
make_user_say "cd"

typewrite "As you might have noticed, the shell prompt shows you where you are, just in case you might be lost!"
sleep 3
