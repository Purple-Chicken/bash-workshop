cd "$TUTOR_ROOT"
# Setup files
echo "Blah blah blah here are some notes. " > notes.txt
echo "I hope nobody is reading this... \nI love cats :3" > .secretnotes.txt

# Create a dummy log file
echo "Starting log..." > web.log
# Background generator: Appends to the log for 30 seconds
(for i in {1..30}; do sleep 2; echo "$(date) - 10.0.0.1 - REPEATED LOGIN ATTEMPT" >> web.log; done) &
GEN_PID=$!

typewrite "When investigating a compromised host, logs can be massive. 'cat' would flood your screen!"
typewrite "One thing that catches my attention is the 'notes.txt' file. I wonder what's in it... "
typewrite "We can use 'cat' to concatenate the contents of our file onto our screen. Let me demonstrate. "
demonstrate "cat notes.txt"

typewrite "Try it for yourself!"
make_user_say "cat notes.txt"

typewrite "Wait, look! There's a hidden file too. Remember 'ls -a'?"
typewrite "I'm not going to show you, but you should check it out for yourself!"
make_user_say "ls -a"
typewrite "So you found my super secret notes... I guess you can read them!"
make_user_say "cat .secretnotes.txt"

typewrite "When investigating a compromised host, logs can be massive."
typewrite "We can use 'head' to see just the first few lines of a file. Watch: "
demonstrate "head -n 5 web.log"

typewrite "On the other hand, 'tail' shows us the most recent activity at the end of the file."
demonstrate "tail -n 3 web.log"

typewrite "Blue Teamers love 'tail -f' because it follows the file in real-time as it grows."
typewrite "Try it now with 'tail -f web.log'. You will see new lines appear every few seconds."
typewrite "When you are done watching the attack, press <C-c> to stop the command and continue the tutor."
make_user_say "tail -f web.log"

# Cleanup the background process
kill $GEN_PID 2>/dev/null

typewrite "Good job! Knowing how to monitor logs in real-time is a critical skill."
sleep 3
