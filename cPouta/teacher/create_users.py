import os, subprocess, secrets
from dotenv import load_dotenv
load_dotenv()

userlist = os.environ.get("USERLIST") 
maildomain = os.environ.get("MAILDOMAIN")

users = [u.strip() for u in userlist.split(',')]
for user in users:
    print("----- user:", user)

    password = secrets.token_hex(6)

    commands = [
        ['useradd', '-m', '-s', '/bin/bash', user],
        ['echo', f'{user}:{password}', '|', 'chpasswd'],
    ]

    try:
        for command in commands:
            result = subprocess.run(command, capture_output=True)
            if result.returncode != 0:
                print(result.stderr)
            
            print(result.stdout)
    except Exception as e:
        print(e)