FROM centos

RUN \
 yum -y install epel-release && \
 yum install -y iptables ca-certificates lxc e2fsprogs && \
 yum -y install docker-io

ADD etc/wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

ADD etc/installtool /usr/local/bin/installtool
ADD etc/setpath /usr/local/bin/setpath
RUN chmod +x /usr/local/bin/installtool

VOLUME /var/lib/docker
CMD ["wrapdocker"]
