#!/bin/sh
groupadd -g 1000 jacky
groupadd -g 805 docker
groupadd -g 804 etcd
groupadd -g 803 git
groupadd -g 802 www
groupadd -g 801 mysql
useradd -u 1000 -g jacky jacky
useradd -u 805 -g docker -s /bin/bash -d /home/docker docker
useradd -u 804 -g etcd -s /sbin/nologin -d /data/etcd -M etcd
useradd -u 803 -g git -s /usr/bin/git-shell -d /data/git git
useradd -u 802 -g www -s /sbin/nologin -d /data/wwwroot -M www
useradd -u 801 -g mysql -s /sbin/nologin -d /data/mysql -M mysql

curl -L http://mirrors.163.com/.help/CentOS7-Base-163.repo -o /etc/yum.repos.d/CentOS-Base.repo
# curl -L http://mirrors.aliyun.com/repo/Centos-7.repo -o /etc/yum.repos.d/CentOS-Base.repo
yum makecache
yum update -y
yum install -y epel-release kernel-devel gcc gcc-c++ make autoconf automake \
    ntp crontabs wget vim-enhanced zip unzip \
    libevent-devel
yum install -y python-pip supervisor
yum clean all
pip install --upgrade pip

mkdir -p /data/run
chown nobody:nobody /data/run
chmod 777 /data/run
mkdir -p /data/logs
