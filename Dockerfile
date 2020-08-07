FROM alpine:3.8

LABEL maintainer "Carlos Ruiz <karlosarr@protonmail.com>"

RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.8/main >> /etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache py2-pip mongodb-tools && \
  pip install -U pip && \
  pip install pymongo && \
  mkdir /backup

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY restore.sh /usr/local/bin/restore
COPY mongouri.py /usr/local/bin/mongouri

VOLUME /backup

CMD /usr/local/bin/entrypoint
