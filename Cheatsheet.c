
// See all build images:
docker images


// remove a build image
docker rmi <image-name-or-id>

// build a image with
// -t "tag" to git the image a name
// . current folder/directory
docker build -t testimage:latest .

// start an exisiting container

docker start <container_id_or_name>


// see all running containers
docker ps

// see all containers
docker ps -a

// remove a container NOT a build
docker rm hopeful_hugle


// run container
// Run in detached mode: Use -d to run the container in the background.
// -it runs the container interactively, allowing you to enter commands in the container’s terminal.
// Map ports: Use -p to expose ports from the container to the host. 8080 is host, 80 is container port
docker run -p 8080:80 test:latest

docker run -it test:latest

docker run --name my-container-name -it test:latest



// acces the bash inside the container
docker exec -it my-container /bin/bash


docker run -it --name testrun -v /Users/ajehle/Desktop/local_inception:/root testimage


// mariadb
// enter db
mysql -h 127.0.0.1 -P 3306 -u "your_user" -p

SHOW DATABASES;

SHOW TABLES;

SELECT * FROM your_table;