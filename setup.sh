#!/usr/bin/env bash 

git clone https://github.com/Purple-Chicken/bash-workshop.git 
cd bash-workshop/ctf
chmod u+x ../tutor.sh 
cargo build --release --bin setup --bin cleanup 
sudo ./target/release/setup 
source ~/.ctf_env 
alias setup=
