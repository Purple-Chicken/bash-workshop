cd "$TUTOR_ROOT"
typewrite "Monitoring running programs is vital for finding miners and reverse shells."
typewrite "'ps aux' gives you a snapshot of every process on the system."
demonstrate "ps aux | head -n 5"

typewrite "If you find a malicious process, use 'kill -9 [PID]' to stop it immediately."
# Simulate a process
sleep 1000 &
MAL_PID=$!
typewrite "A suspicious process is running at PID $MAL_PID. Let's kill it."
demonstrate "kill -9 $MAL_PID"

typewrite "Now you try! Use 'ps' to see your current shell processes."
make_user_say "ps"
sleep 1
