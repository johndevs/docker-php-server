FROM ubuntu:14.10
MAINTAINER John Ahlroos

RUN apt-get update && apt-get install -y lighttpd php5-cgi php5-curl php5-gd php5-sqlite sqlite 

RUN lighty-enable-mod fastcgi
RUN lighty-enable-mod fastcgi-php

EXPOSE 80

ADD ./conf/ /home/root/lighttpd
VOLUME /webroot

RUN useradd http

ENTRYPOINT ["lighttpd", "-D", "-f", "/home/root/lighttpd/lighttpd.conf"]
