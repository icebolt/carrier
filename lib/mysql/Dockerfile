FROM centos:centos6

ADD etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo
ADD etc/yum.repos.d/jimmy.repo /etc/yum.repos.d/jimmy.repo

RUN rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
RUN yum -y groupinstall "Development Tools"
RUN yum -y install cmake ncurses-devel
ADD mysql-5.6.13.tar.gz /softwares/mysql/

RUN \
 groupadd -r mysql && useradd -r -g mysql mysql && \
 cd /softwares/mysql/mysql-5.6.13 && \
 mkdir /opt/mysql && \
 chown mysql.mysql /opt/mysql && \
 cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql-5.6.13 -DMYSQL_UNIX_ADDR=/opt/mysql/mysql.sock -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DWITH_EXTRA_CHARSETS=all -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MEMORY_STORAGE_ENGINE=1 -DWITH_READLINE=1 -DENABLED_LOCAL_INFILE=1 -DMYSQL_DATADIR=/opt/mysql -DMYSQL_USER=mysql -DMYSQL_TCP_PORT=3306 && \
 make && make install && \
 ln -s /usr/local/mysql-5.6.13 /usr/local/mysql && \
 rm -f /usr/lib/libmysqlclient.so.18 && \
 ln -s /usr/local/mysql/lib/libmysqlclient.so.18 /usr/lib && \
 ldconfig && \
 make clean && \
 rm -rf /softwares/mysql/

ENV PATH $PATH:/usr/local/mysql/bin:/usr/local/mysql/scripts
WORKDIR /usr/local/mysql
VOLUME /var/lib/mysql
COPY entrypoint.sh /entrypoint.sh
EXPOSE 3306
ENTRYPOINT ["/entrypoint.sh","mysqld","--datadir=/var/lib/mysql","--user=mysql"]
