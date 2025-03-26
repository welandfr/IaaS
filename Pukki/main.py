import os, subprocess, dotenv, secrets, json
import argparse
from datetime import datetime

"""
Instructions: https://docs.csc.fi/cloud/dbaas/cli/

1. pip3 install python-openstackclient python-troveclient
    OR
   sudo apt install python3-openstackclient python3-troveclient

2. In the openstack web interface, download API Access: OpenStack RC file

3. run the file `source project_1000000-openrc.sh` (enter your CSC password)

4. Test the connection: `openstack datastore list`

4. Check the instance ID in the web interface and copy to .env  (not the same as datastore ID from the above command)

5. `python main.py` OR `python main.py --delete` to delete the user first

USEFUL:
openstack database user list $INSTANCE_ID
openstack database user delete $INSTANCE_ID $USER_NAME



"""
dotenv.load_dotenv()

DB_HOST = os.getenv("DB_HOST", 'localhost')
DB_PORT = os.getenv("DB_PORT", 5432)
INSTANCE_ID = os.getenv("INSTANCE_ID")
USERLIST = [user.strip() for user in os.getenv('USERLIST').split(",")]

# Show instance
try:
    subprocess.run(["openstack", "database", "instance", "show", INSTANCE_ID], check=True)
except:
    print("Failed to show instance, did you source the RC file in this terminal?")
    quit()

connection_urls = {}

# Parse command line arguments
parser = argparse.ArgumentParser()
parser.add_argument("--delete", action="store_true", help="Delete users and databases before creation")
args = parser.parse_args()

print("Creating users... ", end="")
for user in USERLIST:
    password = secrets.token_urlsafe(12)
    db_name = user

    try:
        if args.delete:
            # Delete user and database before recreation
            subprocess.run(["openstack", "database", "user", "delete", INSTANCE_ID, user], check=False)
            subprocess.run(["openstack", "database", "db", "delete", INSTANCE_ID, db_name], check=False)
    
        # Create database
        subprocess.run(["openstack", "database", "db", "create", INSTANCE_ID, db_name], check=True)
         # Create user with database access
        subprocess.run(["openstack", "database", "user", "create", INSTANCE_ID, user, password, "--databases", db_name], check=True)
   
        url = f"postgresql://{user}:{password}@{DB_HOST}:{DB_PORT}/{db_name}"
        connection_urls[user] = url

        print(user, end=' ')
    except Exception as e:
        print(e.output)

print(" ...done.")
json_urls=json.dumps(connection_urls, indent=4)    
print(json_urls)
timestamp = datetime.now().strftime('%Y-%m-%d_%H:%M:%S')
with open(f"out/connections_{timestamp}.txt", "w") as f:
    f.write(json_urls)
