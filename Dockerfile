# BitTorrent Sync
# VERSION 0.2

FROM ubuntu:14.04

MAINTAINER Bill Thornton <billt2006@gmail.com>

# Download and extract the executable to /usr/bin
ADD http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable /usr/bin/btsync.tar.gz
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz

# Web GUI
EXPOSE 8888
# Listening port
EXPOSE 55555

#ENTRYPOINT ["btsync"]

RUN mkdir /shared

VOLUME ["/shared"]

ADD files/btsync.conf /btsync/btsync.conf
ADD files/run_btsync.sh /run_btsync.sh

#USER btsync

CMD ["/run_btsync.sh"]
