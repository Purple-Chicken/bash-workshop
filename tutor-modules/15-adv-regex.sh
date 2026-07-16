cd "$TUTOR_ROOT"
# Setup for adv-regex
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

typewrite "Sometimes 'cut' isn't enough. For complex text, we use 'sed' and 'awk'."
typewrite "'sed' (Stream Editor) is perfect for find-and-replace tasks."

typewrite "Let's mask the IP addresses in our log for a report."
demonstrate "sed 's/192.168.1./[INTERNAL_IP]./g' access.log | head -n 3"

typewrite "'awk' is a full programming language for processing columns."
typewrite "If I want to print the IP and the requested page, I can use awk."
demonstrate "awk '{print $4, $7}' access.log | head -n 5"

typewrite "Now you try! Use 'awk' to print just the 4th column (the IPs) of 'access.log'."
make_user_say "awk '{print $4}' access.log"
sleep 1
