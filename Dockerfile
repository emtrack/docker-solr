FROM n3ziniuka5/ubuntu-oracle-jdk:14.04-JDK8u25
MAINTAINER Laurynas Tretjakovas "laurynas.tretjakovas@gmail.com"

RUN apt-get install -y --no-install-recommends unzip && \
    wget http://apache.mirror.serveriai.lt/lucene/solr/4.10.3/solr-4.10.3.zip && \
    unzip solr-4.10.3.zip && \
    mv solr-4.10.3 /opt/solr-4.10.3 && \
    ln -s /opt/solr-4.10.3 /opt/solr && \
    rm solr-4.10.3.zip

EXPOSE 8983

WORKDIR /opt/solr
ENTRYPOINT ["./bin/solr"]
CMD ["start", "-f"]
