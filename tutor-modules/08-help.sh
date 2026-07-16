cd "$TUTOR_ROOT"

# Define a mock man function to avoid hanging the tutor
function man() {
  cat <<'EOF'
LS(1)                            User Commands                           LS(1)

NAME
       ls - list directory contents

SYNOPSIS
       ls [OPTION]... [FILE]...

DESCRIPTION
       List  information  about  the FILEs (the current directory by default).

       -a, --all
              do not ignore entries starting with .

       -l     use a long listing format

       -h, --human-readable
              with -l and -s, print sizes like 1K 234M 2G etc.

(Press 'q' to simulate exiting the manual)
EOF
}

typewrite "As you explore more complex systems, you'll encounter tools you've never used before."
typewrite "You don't need to memorize every flag. You just need to know how to find the answer."
typewrite "The 'man' (manual) command is your best friend. It's like a built-in encyclopedia for Linux commands."
typewrite "CRITICAL: When you run 'man', it opens in a 'pager'. To exit and return to the shell, you must press 'q'."

typewrite "Let's look at the manual for 'ls'. Remember: press 'q' to exit!"
demonstrate "man ls"
sleep 2

typewrite "Most tools also support the '--help' flag for a quick summary of their options."
demonstrate "cat --help"

typewrite "But the real secret to being fast in the shell is the 'Tab' key."
typewrite "If you start typing a command or a filename and hit Tab, the shell will try to finish it for you."
typewrite "Since we are in a pseudoshell, real Tab Completion won't work here, but in a real BASH shell, you should hit it constantly!"

typewrite "Now you try! Look up the manual for 'man' (yes, it has its own manual!)."
make_user_say "man"

typewrite "Now, try to see the help for the 'pwd' command using the '--help' flag."
make_user_say "pwd --help"
sleep 1

# Remove the mock function after the module finishes
unset -f man
