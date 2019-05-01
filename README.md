# Docker

## Sources
* [Installation docker for Manjaro](https://gamblisfx.com/install-docker-on-manjaro-linux/)
* [Docker docs](https://www.docker.com/get-started)
* [Docker training](https://training.play-with-docker.com/node-sql-server-docker/)

## Hello world with script
As container image I use the [alpine](https://docs.docker.com/samples/library/alpine/) image.
```docker
FROM alpine
```
Make a script that runs "hello world".
```docker
#!/bin/sh
echo "hello world from a script"
```
Copy the script from local directory to the docker container.
```docker
COPY script.sh ./
```
Run the script with shell
```docker
CMD ["sh", "./script.sh"]
```
## Hello world with webserver
As container image I use the [php:7.0-apache](https://hub.docker.com/_/php) image.
```docker
FROM alpine
```
Make a script that runs "hello world".
```php
<?php
echo "hello, world";
```
Copy the script from local directory to the docker container.
```docker
COPY ./index.php /var/www/html
```
Set the outcoming port for the server
```docker
EXPOSE 80
```
Build the hellWorld image
```bash
docker build ./helloWorld
```
Run the hellWorld image with the -p for selecting the internal & external port.
```bash
docker run -p 80:80 container_id
```
If you want that your webserver will be update if you change something in your index.php file you can mount that file to the containers /var/www/html.
```bash
docker run -p 80:80 - v /home/jonas/Nextcloud/DevOps/Jonas/devops_docker/helloWorld/:/var/www/html container_id
```
Open your your web-browser and go to "localhost".

## Sql-server
Use the mysql image.
```docker
FROM mysql
```
Setup the sql login environement variables
```docker
ENV MYSQL_RANDOM_ROOT_PASSWORD=TRUE
```
Start the mysql server
```docker
RUN ["/usr/local/bin/docker-entrypoint.sh"]
```

Build the helloworld image => 
```docker
docker build ./helloWorld
```
Build the sql image => 
```docker
docker build ./node_sql
```
Example:
```docker
λ manjaro devops_docker → λ git master → docker build ./helloWorld  
Sending build context to Docker daemon  3.072kB
Step 1/4 : FROM alpine
 ---> cdf98d1859c1
Step 2/4 : WORKDIR /usr/src/app
 ---> Using cache
 ---> c2f95746c5cb
Step 3/4 : COPY script.sh ./
 ---> Using cache
 ---> f3ec942e6a3a
Step 4/4 : CMD ["sh", "./script.sh"]
 ---> Using cache
 ---> a51d27602b5b
Successfully built a51d27602b5b
```
Run the build image =>
```docker
docker run *a51d27602b5b*
```