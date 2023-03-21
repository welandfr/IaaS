#!/bin/bash

## 
# A silly script to create multiple users on a server
#
# - add usernames to .env
# - while testing, to completely rempove a user:
#     sudo deluser --remove-home username
##

if [ "$USER" != "root" ]
then
    echo "Run this as root or with sudo"
    exit 1
fi

. ./.env

for user in ${USERLIST//,/ }
do
    echo "---- Creating user: $user"
    if id "$user" &>/dev/null; then
        echo "NOTICE: User $user already exists, skipping..."
    else
        PASS=$(openssl rand -hex 6)
        useradd -m -s /bin/bash $user
        echo "$user:$PASS" | chpasswd
        curl -X POST -H "Content-Type: application/json" -d \
                '{ "to": "'$user'@'$MAILDOMAIN'", "subject": "Your credentials", "body": "'$user' / '$PASS'" }' \
                $MAILER_URL
    fi

done

