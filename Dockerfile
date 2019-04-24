FROM alpine

WORKDIR /usr/src/app

COPY script.sh ./

CMD ["sh", "./script.sh"]