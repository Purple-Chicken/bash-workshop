cd "$TUTOR_ROOT"
typewrite "If an attacker is on your box, they are likely talking to the outside world."
typewrite "First, check your own IP address and interfaces with 'ip addr'."
demonstrate "ip addr | grep 'inet ' | head -n 2 2>/dev/null || ip addr show | grep 'inet ' | head -n 2"

typewrite "Next, we use 'ss' (Socket Statistics) to see listening ports."
typewrite "The flags '-tulpn' are a security professional's favorite:"
typewrite "t=TCP, u=UDP, l=Listening, p=Process, n=Numeric ports."
demonstrate "ss -tulpn | head -n 5 2>/dev/null || ss -ant | head -n 5"

typewrite "If you see an unfamiliar port (like 4444 or 1337) listening, investigate it!"

typewrite "Now you try! Use 'ss -tulpn' to check for any listening sockets on this system."
make_user_say "ss -tulpn"
sleep 1
