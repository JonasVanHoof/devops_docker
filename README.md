# Docker

## Sources
* [Installation docker for Manjaro](https://gamblisfx.com/install-docker-on-manjaro-linux/)
* [Docker docs](https://www.docker.com/get-started)
* [Docker training](https://training.play-with-docker.com/node-sql-server-docker/)

## Hello world
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