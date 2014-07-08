FROM nacyot/carbon-base
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

ENV LINE_RECEIVER_INTERFACE 0.0.0.0
ENV LINE_RECEIVER_PORT 2003
ENV PICKLE_RECEIVER_INTERFACE 0.0.0.0
ENV PICKLE_RECEIVER_PORT 2004
ENV RELAY_METHOD consistent-hashing 
ENV DESTINATIONS 172.17.42.1:2014:1, 172.17.42.1:2024:2, 172.17.42.1:2034:3

ADD ./config /opt/graphite/conf/
ADD ./setup_configs.sh /opt/graphite/setup_configs.sh
ADD ./run.sh /opt/graphite/run.sh
EXPOSE 2003 2004

WORKDIR /opt/graphite
CMD ./setup_configs.sh && ./run.sh

