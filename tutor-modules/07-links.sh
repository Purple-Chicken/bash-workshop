# Setup
mkdir -p secrets
echo "SUPER SECRET DATA" > secrets/data.txt

typewrite "The last thing we'll look at today are Links."
typewrite "Let's say we want to keep a file in a deep directory, but we also want a shortcut in this directory."
typewrite "We can use 'ln -s' to create a symbolic link (a symlink) to that file."
typewrite "It's like a shortcut in Windows. Let me show you: "
demonstrate "ln -s secrets/data.txt ./shortcut_to_secrets"
demonstrate "ls -l"
demonstrate "cat shortcut_to_secrets"

typewrite "Symlinks are very common. Attackers often use them to point innocent names to malicious tools."
typewrite "Now you try it! Create a symlink to 'notes.txt' named 'my_link'."
make_user_say "ln -s notes.txt my_link"

typewrite "There is another kind of link called a Hard Link. It's not just a shortcut; it's a second name for the exact same data."
typewrite "Can you create a hard link from 'notes.txt' to './hard_link'?"
make_user_say "ln notes.txt ./hard_link"

typewrite "Notice that if you 'ls -l', the hard link doesn't show an arrow like the symlink does. It just looks like a regular file!"
make_user_say "ls -l hard_link"

typewrite "Great job! You've finished Phase 1 of the workshop."
typewrite "You now know how to navigate, read, and manage files like a pro."
typewrite "Goodbye for now!"
sleep 2
