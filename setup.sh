#!/usr/bin/env bash 
# curl https://raw.githubusercontent.com/Purple-Chicken/bash-workshop/refs/heads/main/setup.sh | bash
git clone https://github.com/Purple-Chicken/bash-workshop.git 
cd bash-workshop/ctf
chmod u+x ../tutor.sh 
cargo build --release --bin setup --bin cleanup 
sudo ./target/release/setup 
source ~/.ctf_env 
alias setup=
