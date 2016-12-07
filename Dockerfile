FROM centos:7
MAINTAINER mara <https://github.com/ma-ra/docker-centos7-apache>

RUN rm /etc/localtime ; ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

RUN yum -y install httpd
RUN yum clean all

ADD httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd","-DFOREGROUND"]
