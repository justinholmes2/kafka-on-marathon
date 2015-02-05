FROM ubuntu:trusty

RUN apt-get update; apt-get install -y unzip openjdk-6-jdk wget git docker.io ruby ruby-dev build-essential

RUN wget -q http://mirror.catn.com/pub/apache/kafka/0.8.1.1/kafka_2.10-0.8.1.1.tgz -O /tmp/kafka_2.10-0.8.1.1.tgz
RUN tar xfz /tmp/kafka_2.10-0.8.1.1.tgz -C /opt
RUN gem install zk

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_2.10-0.8.1.1

ADD run-kafka.sh /opt/run/run-kafka.sh
ADD run-kafka.rb /usr/bin/run-kafka.rb
ADD server.properties.erb /usr/bin/server.properties.erb



ENTRYPOINT ["sh", "/opt/run/run-kafka.sh"]
