FROM centos:centos6

ADD etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo
ADD etc/yum.repos.d/jimmy.repo /etc/yum.repos.d/jimmy.repo

RUN \
 rpm --import file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6 && \
 rm -rf /var/lib/yum/history/*.sqlite && \
 yum -y update --disablerepo=epel\* && \
 yum install -y iptables ca-certificates lxc e2fsprogs && \
 yum -y install docker-io

ADD etc/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

ADD etc/installtool /usr/local/bin/installtool
ADD etc/setpath /depot/setpath
RUN chmod +x /usr/local/bin/installtool

VOLUME /var/lib/docker
CMD ["wrapdocker"]