#!/bin/bash

RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

if ! hash docker-compose; then
 printf "${RED}You must have docker-compose installed${NC}\n"
 exit 1
fi

printf "${CYAN}Running Initial Docker Build${NC}\n"
if ! docker-compose build; then
 printf "${RED}Initial docker build failed${NC}\n"
 exit 2
fi

printf "${CYAN}Installing bundles${NC}\n"
if ! docker-compose run web bundle install; then
 printf "${RED}Bundle installation failed${NC}\n"
 exit 4
fi

printf "${CYAN}Installation Complete, you can now run the OutOfKai App with: ${NC}docker-compose up\n"
exec docker-compose down
