cd "$TUTOR_ROOT"
# Setup for permissions
echo "ELF Data" > suspicious_payload
touch root_shell 2>/dev/null

typewrite "In Linux security, permissions are your primary defense."
typewrite "Every file has three types of permissions: Read (r), Write (w), and Execute (x)."
typewrite "These are assigned to the Owner, the Group, and Everyone else (Others)."

typewrite "Let's look at the permissions of our 'suspicious_payload' using 'ls -l'."
demonstrate "ls -l suspicious_payload"

typewrite "We use 'chmod' (Change Mode) to modify these. You'll often see them as numbers."
typewrite "4 = Read, 2 = Write, 1 = Execute. So '7' (4+2+1) is full access."
typewrite "Let's make our payload 'read-only' for everyone."
demonstrate "chmod 444 suspicious_payload"
demonstrate "ls -l suspicious_payload"

typewrite "A major security risk is a 'world-writable' file (anyone can change it)."
typewrite "Now you try! Give the owner full access (7) but remove all access for others (0) on 'root_shell'."
make_user_say "chmod 700 root_shell"

typewrite "Now, try to change the owner of 'root_shell' to 'root' using 'chown'."
typewrite "(Note: This usually requires sudo, but we'll simulate the attempt.)"
make_user_say "chown root root_shell"
sleep 1
