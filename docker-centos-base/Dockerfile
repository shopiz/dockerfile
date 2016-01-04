FROM centos:latest
MAINTAINER The Centos 6.x Initialize Project
WORKDIR /root/

ADD scripts/ /data/rsync/scripts/
RUN chmod -v 755 /data/rsync/scripts/*; /data/rsync/scripts/init.sh
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD etc/* /etc/
