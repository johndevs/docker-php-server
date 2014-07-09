FROM ubuntu:12.04
MAINTAINER John Ahlroos

RUN apt-get update
RUN apt-get install -y lighttpd php5-cgi

RUN lighty-enable-mod fastcgi
RUN lighty-enable-mod fastcgi-php

EXPOSE 80

ADD ./conf/ /home/root/lighttpd
VOLUME /webroot

RUN useradd http

ENTRYPOINT ["lighttpd", "-D", "-f", "/home/root/lighttpd/lighttpd.conf"]