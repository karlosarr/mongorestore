FROM alpine:3.12.0

LABEL maintainer "Carlos Ruiz <karlosarr@protonmail.com>"

RUN echo http://dl-cdn.alpinelinux.org/alpine/v3.12/main >> /etc/apk/repositories
RUN apk update
RUN apk add --update --no-cache mongodb-tools py2-pip && \
  pip install pymongo && \
  mkdir /backup

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY restore.sh /usr/local/bin/restore
COPY mongouri.py /usr/local/bin/mongouri

VOLUME /backup

CMD /usr/local/bin/entrypoint
