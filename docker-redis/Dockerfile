FROM centos:7-base
MAINTAINER The Redis Server Project
COPY soft/ /data/rsync/soft/
RUN cd /data/rsync/soft/; \
    tar xzf redis-3.0.3.tar.gz; \
    cd redis-3.0.3; \
    make && make PREFIX=/usr/local/redis-3.0.3 install; \
    rm -rf /data/rsync; mkdir /data/redis/
COPY etc/redis.conf /data/etc/redis/
COPY etc/supervisord.conf /etc/supervisord.conf
COPY etc/supervisor.d/ /etc/supervisor.d/
CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 6379
