FROM ubuntu:18.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
WORKDIR /opt/
RUN wget https://github.com/vertcoin-project/vertcoin-core/releases/download/v23.2/vertcoin-23.2-x86_64-linux-gnu.tar.gz
RUN tar zxvf vertcoin-23.2-x86_64-linux-gnu.tar.gz
RUN mv vertcoin-23.2/bin/vertcoin* /usr/bin/
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/vertcoind -printtoconsole
