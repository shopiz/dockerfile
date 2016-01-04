#!/bin/bash
groupadd -g 1000 jacky
groupadd -g 798 etcd
groupadd -g 799 git
groupadd -g 801 www
groupadd -g 802 mysql
useradd -u 1000 -g jacky jacky
useradd -u 798 -g etcd -s /sbin/nologin -d /data/etcd -M etcd
useradd -u 799 -g git -s /usr/bin/git-shell -d /data/git git
useradd -u 801 -g www -s /sbin/nologin -d /data/wwwroot -M www
useradd -u 802 -g mysql -s /sbin/nologin -d /data/mysql -M mysql

curl -L http://mirrors.aliyun.com/repo/Centos-6.repo -o /etc/yum.repos.d/CentOS-Base.repo
yum makecache
yum install -y epel-release kernel-devel gcc gcc-c++ \
    ntp crontabs wget vim-enhanced zip unzip \
    libevent-devel
yum install -y python-pip python-meld3
yum update -y
yum clean all
pip install --upgrade pip
pip install supervisor

mkdir -p /data/run
chown nobody:nobody /data/run
chmod 777 /data/run
mkdir -p /data/logs
