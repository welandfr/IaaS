#!/bin/sh

##
# Script for creating a ready to use database on a cPouta Ubuntu instance.
#
# Run this script to install postgresql. After installation,
# you will have a fresh database with randonly generated name, user and password
# 
# Run this script again to create a new database with new credentals!
#
# You can run this script directly in a Ubuntu 20.04 instance in cPouta. 
# Just copy and paste the following after logging in with SSH:
#
#    wget https://raw.githubusercontent.com/welandfr/IaaS/main/cPouta/student/install_postgres.sh -O - | sh
#
# The credentials for using the database will be displayed while running the script. 
# Enjoy!
#
# - Fredrik Welander

# Create credential variables
PG_DB=$(tr -cd 'a-z' < /dev/urandom | fold -w6 | head -n 1)
PG_USER=$(tr -cd 'a-z' < /dev/urandom | fold -w6 | head -n 1)
PG_PASSWD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w20 | head -n 1)
PG_CONN_URI="postgresql://${PG_USER}:${PG_PASSWD}@[GATEWAY-IP]:543$(hostname -I | cut -d . -f 4 | xargs)/${PG_DB}"

# Install postgres
sudo apt-get update -y && sudo apt install postgresql-12 -y

# Create .pgpass file
[ ! -f ~/.pgpass ] &&  echo "# hostname:port:database:username:password" > ~/.pgpass
echo "localhost:5432:$PG_DB:$PG_USER:$PG_PASSWD" >> ~/.pgpass
chmod 600 ~/.pgpass

# CREATE DB AND USER
sudo -u postgres createuser $PG_USER
sudo -u postgres createdb $PG_DB
sudo -u postgres psql -c "ALTER USER $PG_USER with encrypted password '$PG_PASSWD'"

# Set to listen on all interfaces (port is 5432)
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf

# Add lines to ph_hba.conf (allow IPv4 and IPv6 from everywhere)
if ! sudo grep -q "$PG_USER" "/etc/postgresql/12/main/pg_hba.conf"; then
    echo "host    $PG_DB    $PG_USER     0.0.0.0/0     md5" | sudo tee -a  /etc/postgresql/12/main/pg_hba.conf
    echo "host    $PG_DB    $PG_USER    ::/0          md5" | sudo tee -a  /etc/postgresql/12/main/pg_hba.conf
fi

# Restart postgres
sudo systemctl restart postgresql

# Display credentials
echo "\n\n Databse created, credentials also saved to ~/.pgpass"
echo "    user: $PG_USER"
echo "    database: $PG_DB"
echo "    password: $PG_PASSWD\n"
echo "Connection URI (replace [GATEWAY-IP] with the Floating IP of the gateway server):" 
echo "    $PG_CONN_URI\n"
