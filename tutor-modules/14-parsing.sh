cd "$TUTOR_ROOT"
# Setup for parsing
# Create a larger log file with specific patterns if it doesn't exist
echo "2026-07-16 12:00:00 - Starting access log" > access.log
for i in {1..50}; do
    if (( $i % 7 == 0 )); then
        echo "2026-07-16 12:00:$i - 10.0.0.42 - LOGIN FAILED" >> access.log
    elif (( $i % 13 == 0 )); then
        echo "2026-07-16 12:00:$i - 10.0.0.99 - LOGIN FAILED (Invalid User)" >> access.log
    else
        echo "2026-07-16 12:00:$i - 192.168.1.$i - GET /index.php 200 OK" >> access.log
    fi
done

typewrite "Raw logs are messy. We need to parse them to get specific details."
typewrite "'cut' is great for extracting columns of data."

typewrite "Let's look at our 'access.log'. The IP address is the 4th field if we use spaces as delimiters."
demonstrate "cut -d' ' -f4 access.log | head -n 5"

typewrite "To build a 'Top 10' list of attackers, we combine 'cut', 'sort', and 'uniq -c'."
typewrite "'uniq -c' counts consecutive identical lines, so we MUST 'sort' first."
demonstrate "cut -d' ' -f4 access.log | sort | uniq -c | sort -nr"

typewrite "Now you try! Extract the 4th column (IPs) from 'access.log' and find the unique IP addresses."
make_user_say "cut -d' ' -f4 access.log | sort | uniq"
sleep 1
