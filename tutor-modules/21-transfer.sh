cd "$TUTOR_ROOT"
typewrite "Sometimes you need to bring your own tools onto a host."
typewrite "'curl' and 'wget' are the standard ways to fetch files from a URL."

typewrite "Let's simulate downloading a security audit script."
# Using a simulation that works even without internet
demonstrate "curl -s http://example.com/audit.sh -o audit.sh 2>/dev/null || touch audit.sh"
demonstrate "ls -l audit.sh"
rm -f audit.sh

typewrite "Now you try! Use 'wget' to download a tool from a remote server (we will use -O for the output name)."
make_user_say "wget http://example.com/tool.sh -O tool.sh"
rm -f tool.sh
sleep 1
