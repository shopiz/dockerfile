FROM centos:7-base
MAINTAINER The Memcached Server Project
COPY soft/ /data/rsync/soft/
RUN cd /data/rsync/soft/; \
    tar xzf memcached-1.4.15.tar.gz; \
    cd memcached-1.4.15; \
    ./configure --prefix=/usr/local/memcached-1.4.15 && make && make install; \
    rm -rf /data/rsync
COPY etc/supervisord.conf /etc/supervisord.conf
COPY etc/supervisor.d/ /etc/supervisor.d/
CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 11211
