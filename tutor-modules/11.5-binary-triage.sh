cd "$TUTOR_ROOT"
typewrite "When you find a suspicious file, the first thing to do is identify what it actually IS."
typewrite "Attackers often rename binaries (like calling a malware script 'ls') to trick you."
typewrite "The 'file' command looks at the file's headers to tell you its true nature."

# Setup some tricky files
echo "#!/bin/bash" > legit_tool
echo "echo 'Doing legit things'" >> legit_tool
mv legit_tool legit_tool.png 2>/dev/null

typewrite "Let's see what 'legit_tool.png' actually is."
demonstrate "file legit_tool.png"

typewrite "Next, if you have a binary but can't run it safely, you can use 'strings'."
typewrite "This tool extracts all the human-readable text from inside a binary file."
typewrite "It's perfect for finding hardcoded IP addresses, URLs, or developer comments."

# Create a "binary" with hidden strings
echo -e "\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00" > suspicious_payload
echo "C2_SERVER=192.168.10.42" >> suspicious_payload
echo "http://malicious-site.com/gate" >> suspicious_payload

typewrite "Let's use 'strings' to look for indicators of compromise inside our suspicious payload."
demonstrate "strings suspicious_payload"

typewrite "Now it's your turn! Use the 'file' command to check 'suspicious_payload'."
make_user_say "file suspicious_payload"

typewrite "Now, use 'strings' to find the hidden IP address inside 'suspicious_payload'."
make_user_say "strings suspicious_payload"
sleep 1
