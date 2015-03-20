FROM centos:centos6

ADD etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo
ADD etc/yum.repos.d/jimmy.repo /etc/yum.repos.d/jimmy.repo

RUN rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
RUN yum -y groupinstall "Development Tools"
RUN yum install -y pcre-devel zlib-devel

ADD nginx-1.4.2.tar.gz /softwares/nginx/
RUN cd /softwares/nginx/nginx-1.4.2 && ./configure --with-http_stub_status_module --prefix=/usr/local/nginx-1.4.2 --with-http_gzip_static_module && \
    make && make install
RUN ln -s /usr/local/nginx-1.4.2 /usr/local/nginx
RUN echo -e "\ndaemon off;" >> /usr/local/nginx/conf/nginx.conf
RUN rm -rf /usr/local/nginx/logs && mkdir -p /log/nginxlogs/ && ln -s /log/nginxlogs/ /usr/local/nginx/logs
RUN rm -rf /softwares/nginx

EXPOSE 80

CMD ["/usr/local/nginx/sbin/nginx"]
