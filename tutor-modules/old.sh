typewrite "Welcome to the interactive shell tutor!"
typewrite "To exit this program, press <C-c> to quit at any time. "
sleep 2.5
typewrite "In UNIX, everything is a file."
typewrite "  - your text files";  typewrite "  - your images"; typewrite "  - your videos"; typewrite "  - your programs"; typewrite "Even your directories are stored as files!";
typewrite "Everything is stored in a text file if it can be. ";  typewrite "So, if you want to change the users, your program configs, or even system settings, there is always a file you can open in a text editor to change it!" 
# clear 
typewrite "Throughout this demo, we will be doing operations within a pseudoshell. You will be able to only execute the command that you are explicitly told to execute."
mkdir tutor 2>/dev/null ; cd tutor ; echo "Blah blah blah here are some notes. " > notes.txt ; echo "I hope nobody is reading this... " > .secretnotes.txt ; mkdir stuff 2>/dev/null; touch stuff/stuff1.txt stuff/stuff2.txt stuff/stuff3.txt && echo "One stuff" > stuff/stuff1.txt ; echo "Two stuff" > stuff/stuff2.txt 

# Fake ssh - not setting that up :)
typewrite "Our first command will put us in the pseudoshell. Using SSH, we can get remote shell access to a computer, both in Windows and in Linux. The command goes as follows: "
printf "%s" "> "
sleep $linewait 
typewrite "ssh demo@192.168.1.1"
sleep 2 
printf "%s" "[demo@remoteshell $(pwd | sed "s/.*\/\(.*\)/\1/")]$ "
sleep 1 
echo '^D'
clear 
typewrite "As you can see, we have ssh'ed into a remote machine using the ssh command. Try it out on your own!" 
user_input=""
  typewrite "Now, type in 'ssh user@192.168.1.1'"
  sleep 0.5
  read -p "> " user_input

  if [[ "$user_input" == 'ssh user@192.168.1.1' ]]; then
    sleep 2
    printf "%s" "[user@shelldemo$(pwd | sed "s/.*\/\(.*\)/\1/")]$ "
    sleep 1 
    echo '^D'
    clear 
  fi

  while [[ "$user_input" != 'ssh user@192.168.1.1' ]]; do
    typewrite "Try again! Type in 'ssh user@192.168.1.1'"
    sleep 0.5
    read -p "> " user_input
    if [[ "$user_input" == 'ssh user@192.168.1.1' ]]; then
      sleep 2
      printf "%s" "[user@shelldemo$(pwd | sed "s/.*\/\(.*\)/\1/")]$ "
      sleep 1 
      echo '^D'
      clear 
      break
    fi
  sleep $linewait ; sleep $linewait 
  echo " "
  done

typewrite "We are now in the remote system! However, do we know where we really are? We can use the 'pwd' command to print the current working directory. Here is an example: "
demonstrate "pwd"
typewrite "Try it on your own!"
make_user_say "pwd"
typewrite "Alright, now we know where we are in the filesystem. But, what is in our current directory?"
typewrite "We can use 'ls' to list the stuff in our current directory. Let me show you."
demonstrate "ls"
typewrite "Now it's your turn!" 
make_user_say "ls" 

typewrite "You can see we have several files and folders in this directory."
typewrite "One thing that catches my attention is the 'notes.txt' file. I wonder what's in it... "
typewrite "We can use 'cat' to concatenate the contents of our file onto our screen. Let me demonstrate. "
demonstrate "cat notes.txt" 
typewrite "Try it for yourself!"
make_user_say "cat notes.txt"
typewrite "Another thing that catches my attention is the 'stuff' folder. "
typewrite "To read what is in the 'stuff' directory, we can use 'ls stuff' to see what's in there. Here's how it works: "
demonstrate "ls stuff"
typewrite "You know what to do!"
make_user_say "ls stuff"
typewrite "Let's say we want to work with things in the 'stuff' directory. We can obviously 'cat' out the contents of the files by including the path: "
demonstrate "cat stuff/stuff1.txt"
typewrite "Or, we can also change our working directory and then do the commands from there. "
demonstrate "pwd"
demonstrate "cd stuff"
demonstrate "pwd"
demonstrate "ls"
demonstrate "cat stuff1.txt"
cd ..
typewrite "Now you try it!" 
make_user_say "cat stuff/stuff2.txt"
make_user_say "cd stuff"
make_user_say "cat stuff2.txt"
typewrite "As you might have noticed, the shell prompt shows you the name of the highest level directory, just in case you might be lost!"
typewrite "Ok! Now that we have looked at the stuff here, we can go back to the previous directory by using 'cd ..' , which moves us back to the parent directory. Here is how it looks like: "
demonstrate "cd .."
typewrite "Now it's your turn!" 
cd stuff;
make_user_say "cd .."
typewrite "Remember how we listed all the files in this directory? Well, we technically didn't list all the files. To do so, you have to specify a flag to the 'ls' command. "
typewrite "I'm not going to do it for you!" 
make_user_say "ls -a" 
typewrite "So you found my super secret notes..."
typewrite "I guess you can read them"
make_user_say "cat .secretnotes.txt"
typewrite "We can copy those notes to another file. Let me show you. "
demonstrate "ls -a"
demonstrate "cp .secretnotes.txt backup_secret.txt"
demonstrate "ls -a"
demonstrate "cat backup_secret.txt"
rm backup_secret.txt 
typewrite "Now you try copying the secrets!"
make_user_say "cp .secretnotes.txt notsosecret.txt"
typewrite "Uh oh, I think I want to rename this file!"
typewrite "Fortunately, I can use the 'mv' command to move the contents of the file to a different filename. "
typewrite "We can even move it to be under a different directory!"
demonstrate "mv notsosecret.txt stuff/notsecret.txt"
demonstrate "ls" 
demonstrate "ls stuff"
typewrite "See, it's no longer here! Can you do the same?"
mv stuff/notsecret.txt notsosecret.txt 
make_user_say "mv notsosecret.txt stuff/notsosecret.txt"
typewrite "Let's say we want to keep the file in the 'stuff' directory, but we also want a shortcut in this directory. We can use 'ln' to create a hard link, and 'ln -s' to create a symlink to that file. "
demonstrate "ln -s stuff/notsosecret.txt ./symlinked_secret"
demonstrate "ls" 
demonstrate "cat symlinked_secret"
typewrite "Can you do the same with a hard link?" 
make_user_say "ln stuff/notsosecret.txt ./hardlinked_secret"


typewrite "These are all the commands for now. Goodbye world!"
rm -fr tutor 
