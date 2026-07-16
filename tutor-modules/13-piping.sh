cd "$TUTOR_ROOT"
# Setup for piping
# Create a larger log file with specific patterns if it doesn't exist
echo "2026-07-16 12:00:00 - Starting access log" > access.log
for i in {1..50}; do
    if (( $i % 7 == 0 )); then
        echo "2026-07-16 12:00:$i - 10.0.0.42 - LOGIN FAILED" >> access.log
    elif (( $i % 13 == 0 )); then
        echo "2026-07-16 12:00:$i - 10.0.0.99 - LOGIN FAILED (Invalid User)" >> access.log
    elif (( $i % 5 == 0 )); then
        echo "2026-07-16 12:00:$i - 192.168.1.$i - POST /login.php 200 OK" >> access.log
    else
        echo "2026-07-16 12:00:$i - 192.168.1.$i - GET /index.php 200 OK" >> access.log
    fi
done
echo "2026-07-16 12:01:00 - 10.0.0.1 - SUSPICIOUS activity detected" >> access.log

typewrite "The pipe '|' is the most powerful tool in the shell."
typewrite "It takes the output of one command and feeds it as the input to another."

typewrite "As a Blue Teamer, you'll use this to filter logs."
typewrite "Let's find all POST requests in our 'access.log' and filter out the successful (200 OK) ones."
demonstrate "grep 'POST' access.log | grep -v '200 OK'"

typewrite "We can also use grep with context flags:"
typewrite "'-A 2' shows 2 lines AFTER the match. '-B 2' shows 2 lines BEFORE."
demonstrate "grep -A 2 'SUSPICIOUS' access.log"

typewrite "Now you try! Find all lines in 'access.log' containing 'FAILED' and count how many there are."
typewrite "(Hint: use 'grep FAILED access.log | wc -l')"
make_user_say "grep FAILED access.log | wc -l"
sleep 1
