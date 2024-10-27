# #!/bin/bash
# echo -e "---> MariaDB Server start"

# # Start the MySQL daemon
# service mariadb start

# # until mysqladmin ping --silent; do
# #     echo "Waiting for MariaDB to be ready..."
#     sleep 10
# # done

# #files reinladen
# echo "CREATE DATABASE IF NOT EXISTS \`test_name\` ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS 'test_user'@'%' IDENTIFIED BY 'test_pwd' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON \`test_name\`.* TO 'test_user'@'%' ;" >> db1.sql
# # echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql
# mysql < db1.sql



# service mariadb stop

# sleep 10
# exec mariadbd --user=mysql

#!/bin/bash
echo -e "---> Starting MariaDB Server"

# Start the MySQL daemon
service mariadb start

# Wait for MariaDB to be ready
until mysqladmin ping --silent; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

# Create the database and user
echo "CREATE DATABASE IF NOT EXISTS \`test_name\`;" > db1.sql
echo "CREATE USER IF NOT EXISTS 'test_user'@'%' IDENTIFIED BY 'test_pwd';" >> db1.sql
echo "GRANT ALL PRIVILEGES ON \`test_name\`.* TO 'test_user'@'%';" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql

# Stop the service after setup
service mariadb stop

# Start the MariaDB daemon in the foreground
exec mariadbd --user=mysql --bind-address=0.0.0.0
