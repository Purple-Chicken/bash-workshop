cd "$TUTOR_ROOT"
# Setup some files for matching
touch file1.txt file2.txt file3.txt data_A.log data_B.log config.php notes.txt 2>/dev/null

# Create a larger log file with specific patterns
# We overwrite it to ensure idempotency
echo "2026-07-16 12:00:00 - Starting access log" > access.log
for i in {1..50}; do
    if (( $i % 7 == 0 )); then
        echo "2026-07-16 12:00:$i - 10.0.0.42 - LOGIN FAILED" >> access.log
    elif (( $i % 13 == 0 )); then
        echo "2026-07-16 12:00:$i - 10.0.0.99 - LOGIN FAILED (Invalid User)" >> access.log
    else
        echo "2026-07-16 12:00:$i - 192.168.1.$i - GET /index.php 200" >> access.log
    fi
done

typewrite "When you're dealing with dozens of files, typing each name is a waste of time."
typewrite "BASH has 'Wildcards' (or globs) to help you match patterns."
typewrite "The most common one is '*', which matches ANY number of characters."

typewrite "If I want to list all files ending in '.txt', I can use 'ls *.txt'."
demonstrate "ls *.txt"

typewrite "The '?' wildcard matches exactly ONE character."
demonstrate "ls file?.txt"

typewrite "And we have '[]' to match a specific set of characters."
demonstrate "ls file[12].txt"

typewrite "Now let's introduce 'grep'. It's like a search engine for the contents of your files."
typewrite "If I want to find the word 'FAILED' in our 'access.log', I can grep for it."
demonstrate "grep FAILED access.log"

typewrite "Now you try! List all files in the current directory that end in '.log' using a wildcard."
make_user_say "ls *.log"

typewrite "Now, use grep to find all the 'FAILED' attempts in 'access.log'."
make_user_say "grep FAILED access.log"
sleep 1
