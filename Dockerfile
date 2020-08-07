FROM alpine:3.12.0

LABEL maintainer "Carlos Ruiz <karlosarr@protonmail.com>"

RUN echo http://dl-4.alpinelinux.org/alpine/edge/releases >> /etc/apk/repositories && \
  apk update && \
  apk add --update --no-cache mongodb-tools py2-pip && \
  pip install pymongo && \
  mkdir /backup

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY restore.sh /usr/local/bin/restore
COPY mongouri.py /usr/local/bin/mongouri

VOLUME /backup

CMD /usr/local/bin/entrypoint
