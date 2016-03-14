FROM debian:jessie

MAINTAINER Loic Ortola <contact@loicortola.com>

ENV VERSION=0.10.4.1-1

RUN apt-get update && apt-get install -y curl
RUN curl -s -o /tmp/telegraf_latest_amd64.tar.gz http://get.influxdb.org/telegraf/telegraf-${VERSION}_linux_amd64.tar.gz
RUN tar -xzvf /tmp/telegraf_latest_amd64.tar.gz -C /
RUN rm /tmp/telegraf_latest_amd64.tar.gz

COPY telegraf.conf.template /config/telegraf.conf.template

COPY run.sh /run.sh

RUN chmod +x /run.sh

ENV HOST=localhost
ENV PORT=8086
ENV DB=metrics
ENV NODE_NAME=node
ENV INTERVAL=1s

CMD ["/run.sh"]
