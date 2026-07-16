# Setup
mkdir -p stuff
echo "I am a suspicious script." > malware.py

typewrite "Now let's look at how we can manage our files."
typewrite "We have four main tools: 'mkdir' to make directories, 'cp' to copy, 'mv' to move or rename, and 'rm' to remove."

typewrite "We can copy our logs to a backup file. Let me show you: "
demonstrate "cp notes.txt backup_notes.txt"
demonstrate "ls"

typewrite "Now you try! Copy 'notes.txt' to a file named 'my_backup.txt'."
make_user_say "cp notes.txt my_backup.txt"

typewrite "Uh oh, I think I want to rename this file!"
typewrite "Fortunately, I can use the 'mv' command to move the contents of the file to a different filename."
demonstrate "mv my_backup.txt renamed_backup.txt"

typewrite "We can even move it into a different directory!"
demonstrate "mv renamed_backup.txt stuff/old_notes.txt"
demonstrate "ls stuff"

typewrite "See, it's no longer in our main folder! Can you do the same?"
make_user_say "mv backup_notes.txt stuff/backup.txt"

typewrite "Sometimes we need to delete evidence or malware. We use 'rm' for that."
typewrite "Let's get rid of that 'malware.py' file. Watch: "
demonstrate "rm malware.py"

typewrite "Your turn! Delete the 'renamed_backup.txt' if you still have it, or just try to remove something you created."
typewrite "Wait, let's just have you delete 'stuff/backup.txt'."
make_user_say "rm stuff/backup.txt"

typewrite "But wait... attackers can be tricky. They can make a file 'immutable'."
typewrite "This means even the root user can't delete it easily!"
typewrite "Always check for this with 'lsattr' if a file just won't die. You'd need 'chattr -i' to fix it."
typewrite "Security professionals always check for this when a file won't die! I'm not going to make you do it now, but keep it in mind."
sleep 1
