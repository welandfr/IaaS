# cPouta for students

This guide is for instances created with the Ubuntu 20.04 image.

## Create Postgresql database (reachable from the outside world)

1. Edit _Security Groups_ on your instance, Add PostgreSQL
2. Log in to your instance with SSH
3. copy and paste the following line to the terminal:     
`wget https://raw.githubusercontent.com/welandfr/IaaS/main/cPouta/student/install_postgres.sh -O - | sh`
4. Use the provided credentials to use your database, connect to the SSH-GATEWAY server's Floating IP on the port 543[last octet of your ip]. 

    So, if your IP is `192.168.1.15`, and the SSH-GATEWAY server has a Floating IP of `128.214.200.250`, you would reach your PostgreSQL database on port `54315` on `128.214.200.250`
    
    If your connect using the connection URI provided by the script (something like `postgresql://pfhocv:m2eqKsNHrF4NyMvhujjK@[GATEWAY-IP]:54313/dsvjnk`) just replace [GATEWAY-IP] with the real gateway IP. 