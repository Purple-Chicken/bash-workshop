cd "$TUTOR_ROOT"
# Setup for hashing
echo -e "\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00" > suspicious_payload
echo "2026-07-16 12:00:00 - Starting access log" > access.log
echo "Investigation started" > location.txt

typewrite "In forensics, verifying file integrity is mandatory. We use hashing for this."
typewrite "A hash is a unique digital fingerprint. If even one bit of the file changes, the hash changes."

typewrite "Let's generate a SHA-256 hash for our suspicious payload."
demonstrate "sha256sum suspicious_payload"

typewrite "Security professionals check these hashes against databases like VirusTotal."
typewrite "If you find a file and its MD5 hash is 'd41d8cd98f00b204e9800998ecf8427e', you know it's an empty file."

typewrite "Now you try! Generate an MD5 hash for the 'access.log' file."
make_user_say "md5sum access.log"

typewrite "Now, generate a SHA-256 hash for the 'location.txt' file we created earlier."
make_user_say "sha256sum location.txt"
sleep 1
