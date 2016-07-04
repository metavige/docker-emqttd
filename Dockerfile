FROM ubuntu:trusty
MAINTAINER Ricky Chiang <metavige@gmail.com>

COPY run.sh /

RUN apt-get update && \
  apt-get install -y wget unzip && \
  \
  echo " =====> download and install emqttd" && \
  wget -q http://emqtt.io/downloads/stable/ubuntu -O /tmp/emqttd.zip && \
  unzip /tmp/emqttd.zip -d /opt && \
  sed -i 's/emqttd\@127.0.0.1/emqttd@0.0.0.0/g' /opt/emqttd/etc/vm.args && \
  \
  echo " =====> clean apt cache" && \
  apt-get remove -y wget unzip && \
  rm -rf /var/lib/apt/lists/* && \
  chmod +x /run.sh

EXPOSE 1883 8883 8083 18083

VOLUME ["/opt/emqttd/etc", "/opt/emqttd/data", "/opt/emqttd/plugins"]

CMD ["/run.sh"]
