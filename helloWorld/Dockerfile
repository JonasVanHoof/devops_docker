# # used base image
# FROM alpine

# # working path
# WORKDIR /usr/src/app

# # copy script from local directory to the docker container
# COPY script.sh ./

# # run the script with shell
# CMD ["sh", "./script.sh"]

#hello world from webserver
FROM php:7.0-apache
COPY ./index.php /var/www/html
EXPOSE 80

#run this command to mound the index.php file to the container
#CMD [docker run -p 80:80 -v /home/jonas/Nextcloud/DevOps/Jonas/devops_docker/helloWorld/:/var/www/html bece42480307]