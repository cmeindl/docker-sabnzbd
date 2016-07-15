FROM timhaak/base:latest
MAINTAINER Tim Haak <tim@haak.co>

RUN add-apt-repository -y  ppa:jcfp/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes sabnzbdplus \
    par2 python-yenc unzip unrar && \
    apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

VOLUME ["/config","/data"]

EXPOSE 8080 9090

CMD ["/usr/bin/sabnzbdplus","--config-file","/config","--console","--server", "0.0.0.0:8080"]
