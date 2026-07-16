cd "$TUTOR_ROOT"
typewrite "Persistence is how attackers survive a reboot. We must check common hiding spots."
typewrite "1. Cron Jobs: Scheduled tasks."
demonstrate "crontab -l 2>/dev/null || echo 'No crontab for user.'"

typewrite "2. Services: Malicious programs running as system services."
typewrite "Use 'systemctl list-unit-files --type=service' to see all services."
demonstrate "systemctl list-unit-files --type=service 2>/dev/null | head -n 5 || echo 'No systemd available.'"

typewrite "3. Open Files: Use 'lsof' (List Open Files) to see which PID owns a socket or file."
demonstrate "lsof -i :80 2>/dev/null || echo 'No process on port 80.'"

typewrite "Now you try! Check for any scheduled tasks using 'crontab -l'."
make_user_say "crontab -l"
sleep 1
