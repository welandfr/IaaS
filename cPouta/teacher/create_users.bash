#!/bin/bash
. ./.env
for user in ${USERLIST//,/ }
do
    echo "---- Creating user: $user"
    PASS=$(openssl rand -hex 6)
    useradd -m -s /bin/bash $user
    echo "$user:$PASS" | chpasswd
    
done

# sudo deluser  --remove-home welandfr && sudo deluser --remove-home fredrik.welander

