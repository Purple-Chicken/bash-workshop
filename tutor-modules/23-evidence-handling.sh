cd "$TUTOR_ROOT"
# Setup for evidence handling
echo "2026-07-16 12:00:00 - Starting access log" > access.log
echo "Investigation started" > location.txt
echo -e "\x7fELF\x02\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00" > suspicious_payload

typewrite "Final Step: Evidence Handling. You've found the logs and payloads—now you need to package them safely."
typewrite "'tar' (Tape Archive) bundles files together, and 'gzip' compresses them to save space."

typewrite "Let's bundle all our evidence into one compressed archive."
demonstrate "tar -czf evidence_package.tar.gz access.log location.txt suspicious_payload"

typewrite "You can verify the contents of the archive without extracting it using '-tf'."
demonstrate "tar -tf evidence_package.tar.gz"

typewrite "Now you try! Create a compressed archive named 'logs_backup.tar.gz' containing only the 'access.log' file."
make_user_say "tar -czf logs_backup.tar.gz access.log"

typewrite "Phase 5 Complete! You have finished the Blue Team BASH Workshop."
typewrite "You now have the fundamental skills to navigate, audit, and defend a Linux system."
typewrite "Keep practicing, stay curious, and always check your hashes. Goodbye!"
sleep 3
