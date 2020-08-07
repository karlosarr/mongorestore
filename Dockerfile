FROM alpine:edge

LABEL maintainer "Carlos Ruiz <karlosarr@protonmail.com>"

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk update && \
  apk add --no-cache mongodb-tools py2-pip && \
  pip install pymongo && \
  mkdir /backup

COPY entrypoint.sh /usr/local/bin/entrypoint
COPY restore.sh /usr/local/bin/restore
COPY mongouri.py /usr/local/bin/mongouri

VOLUME /backup

CMD /usr/local/bin/entrypoint
