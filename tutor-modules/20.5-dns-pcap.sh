cd "$TUTOR_ROOT"
typewrite "If you see a suspicious IP, you need to know who it belongs to. 'dig' is the standard tool for DNS lookups."
typewrite "Let's check the DNS records for a common target."
demonstrate "dig google.com +short"

typewrite "For live analysis, 'tcpdump' is the gold standard. It captures packets directly from the wire."
typewrite "In a real incident, you'd capture traffic to a file for analysis in Wireshark."
typewrite "Example: 'tcpdump -i eth0 -w traffic.pcap'"

typewrite "We'll simulate a quick capture of 2 packets. (Note: tcpdump usually requires sudo/root access!)"
demonstrate "tcpdump -c 2 -n 2>/dev/null || echo '[Simulation] Capturing 2 packets... done.'"

typewrite "Now you try! Resolve the IP address of 'hackthebox.com' using 'dig'."
make_user_say "dig hackthebox.com +short"
sleep 1
