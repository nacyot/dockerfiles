FROM centos:centos6
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum update -y
RUN yum -y install httpd git
RUN cd /opt; git clone https://github.com/grafana/grafana.git
RUN cd /opt/grafana; git checkout $(git describe --tags `git rev-list --tags --max-count=1`)

RUN rm -f /etc/localtime
RUN cp -p /usr/share/zoneinfo/Japan /etc/localtime

RUN mkdir -p /opt/grafana/src/config

ADD ./config.js /opt/grafana/src/config.js
ADD ./grafana.conf /etc/httpd/conf.d/grafana.conf
ADD ./setup_configs.sh /opt/grafana/setup_configs.sh
ADD ./run.sh /opt/grafana/run.sh

ENV ES_API_HOST 172.17.42.1
ENV ES_API_PORT 9200
ENV GRAPHITE_API_HOST 172.17.42.1
ENV GRAPHITE_API_PORT 8000

WORKDIR /opt/grafana

EXPOSE 8000
CMD ./setup_configs.sh && ./run.sh

