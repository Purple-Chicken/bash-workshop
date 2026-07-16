cd "$TUTOR_ROOT"
typewrite "In security, you often need to find files based on more than just their name."
typewrite "For forensics, we might want to find every file modified in the last 24 hours."
typewrite "We can use '-mtime' (modified time) for this. '-mtime -1' means 'less than 1 day ago'."
demonstrate "find . -mtime -1"

typewrite "Or perhaps we are looking for large log files that might be filling up the disk."
typewrite "We can use '-size' to find files over a certain limit, like 1 Megabyte."
# Create a dummy large-ish file
truncate -s 2M big_log_file.log 2>/dev/null || fallocate -l 2M big_log_file.log || dd if=/dev/zero of=big_log_file.log bs=1M count=2 2>/dev/null
demonstrate "find . -size +1M"

typewrite "Most importantly for Blue Teamers, we can find files with specific permissions."
typewrite "A common privilege escalation vector is a 'SUID' binary (Set User ID)."
typewrite "These run with the permissions of the file owner (usually root), no matter who runs them."

# Setup a dummy SUID file
touch root_shell
chmod 4755 root_shell 2>/dev/null
typewrite "To find these dangerous files, we use '-perm -4000'."
demonstrate "find . -perm -4000"

typewrite "Now you try! Find all files in the current directory that are larger than 100 Kilobytes."
make_user_say "find . -size +100k"

typewrite "Now, try to find any file that has the SUID bit set (permission -4000)."
make_user_say "find . -perm -4000"
sleep 1
