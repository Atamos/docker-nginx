FROM centos:6
MAINTAINER Marco Sciatta "marco.sciatta@gmail.com"
ENV UPDATED_AT 2015-01-08

RUN yum -y update && yum clean all
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN yum install nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
