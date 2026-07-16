#!/usr/bin/env bash
# curl https://raw.githubusercontent.com/user/repo/refs/heads/main/setup.sh | bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "[*] Cloning repository..."
git clone https://github.com/Purple-Chicken/bash-workshop.git 
cd bash-workshop/ctf

# Fix permissions on tutor.sh
chmod u+x ../tutor.sh 

# Ensure Cargo and Rust are installed
echo "[*] Installing Rust system dependencies..."
sudo apt update && sudo apt install cargo rustc -y

# Build the initialization and cleanup helper binaries
echo "[*] Building workshop binaries..."
cargo build --release --bin setup --bin cleanup 

# Run the Rust setup script with elevated privileges
# Using 'sudo -E' passes current environment variables if any are needed
echo "[*] Running setup configurations..."
sudo ./target/release/setup 

# =====================================================================
# SYSTEM PATHS AND PERSISTENCE COUPLING
# =====================================================================

# 1. Establish the Verify & Cleanup binaries globally in /usr/local/bin
# (This ensures they are in PATH and work instantly in any terminal session)
echo "[*] Copying verify and cleanup to /usr/local/bin..."
sudo cp ./target/release/verify /usr/local/bin/verify
sudo cp ./target/release/cleanup /usr/local/bin/ctf-cleanup
sudo chmod 755 /usr/local/bin/verify /usr/local/bin/ctf-cleanup

# 2. Persist the environment variables & alias in the user's home profile
# We append a sourcing command to ~/.bashrc so it survives terminal restarts
if [ -f "$HOME/.ctf_env" ]; then
    # Prevent duplicate entries if they run setup multiple times
    if ! grep -q "source \$HOME/.ctf_env" "$HOME/.bashrc"; then
        echo -e "\n# Bash Workshop CTF Environment\nsource \$HOME/.ctf_env" >> "$HOME/.bashrc"
    fi
fi

echo -e "\n\n=================================================="
echo "🎉 CTF Workshop Setup is Complete!"
echo "=================================================="
echo "The tools 'verify' and 'ctf-cleanup' are now globally available."
echo ""
echo "👉 IMPORTANT: To initialize variables in your current terminal pane, run:"
echo "   source ~/.bashrc"
echo "==================================================\n"
