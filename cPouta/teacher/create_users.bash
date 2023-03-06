#!/bin/bash
. ./.env
for i in ${USERLIST//,/ }
do
    # call your procedure/other scripts here below
    echo "$i"
done

