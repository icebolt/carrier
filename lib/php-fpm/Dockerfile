FROM centos:centos6

ADD etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo
ADD etc/yum.repos.d/jimmy.repo /etc/yum.repos.d/jimmy.repo

RUN rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
RUN yum -y groupinstall "Development Tools"
RUN yum -y install openssl-devel libxml2-devel libcurl-devel

ADD php-5.4.19.tar.bz2 /softwares/php/
RUN cd /softwares/php/php-5.4.19/ && ./configure --prefix=/usr/local/php-5.4.19 --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-iconv  --enable-mbstring --with-curl --with-zlib --enable-pcntl --enable-sysvsem --enable-sysvshm --with-openssl && make && make install

RUN ln -s /usr/local/php-5.4.19 /usr/local/php

RUN rm -rf /softwares/php/

EXPOSE 9000

#CMD ["/usr/local/nginx/sbin/nginx"]
