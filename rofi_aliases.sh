#!/bin/zsh
# To be copied to /usr/local/bin as an executable script
# fetch all zsh aliases 
alias | awk -F'[ =]' '{print $1}'
