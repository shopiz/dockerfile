FROM centos:7.2.1511
MAINTAINER The Centos 7.x Initialize Project
WORKDIR /root/

ADD scripts/ /data/rsync/scripts/
RUN chmod -v 755 /data/rsync/scripts/init.sh; /data/rsync/scripts/init.sh; rm -rf /data/rsync/scripts/
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ADD etc/* /etc/
