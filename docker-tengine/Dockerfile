FROM centos:7-base
MAINTAINER The Nginx Server Project
COPY soft/ /data/rsync/soft/
COPY etc/nginx/ /data/etc/nginx/
RUN yum install -y pcre-devel openssl-devel; yum clean all
RUN cd /data/rsync/soft/; \
    tar xzf tengine-2.1.1.tar.gz; \
    cd tengine-2.1.1; \
    ./configure --prefix=/usr/local/nginx-1.6.2 --user=www --group=www --with-http_stub_status_module --with-http_ssl_module --with-http_flv_module --with-http_gzip_static_module --with-http_realip_module --with-http_concat_module && make -j4 && make install; \
    rm -rf /data/rsync; ln -s -f /data/etc/nginx/* /usr/local/nginx-1.6.2/conf/
COPY etc/supervisord.conf /etc/supervisord.conf
COPY etc/supervisor.d/ /etc/supervisor.d/
CMD ["/usr/bin/supervisord", "-n"]
EXPOSE 80
EXPOSE 443
