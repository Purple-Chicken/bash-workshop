typewrite "Let's say we want to keep the file in the 'stuff' directory, but we also want a shortcut in this directory. We can use 'ln' to create a hard link, and 'ln -s' to create a symlink to that file. "
demonstrate "ln -s stuff/notsosecret.txt ./symlinked_secret"
demonstrate "ls" 
demonstrate "cat symlinked_secret"
typewrite "Can you do the same with a hard link?" 
make_user_say "ln stuff/notsosecret.txt ./hardlinked_secret"

typewrite "These are all the commands for now. Goodbye world!"
