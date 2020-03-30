FROM ubuntu:bionic


MAINTAINER Francois Rainville <francoisrainville@effenco.com>

RUN apt-get -y update && \
    apt-get -y install wget && \
	apt-get -y install unzip && \
	apt-get -y install tar
	
RUN wget -P /tmp https://transfer.sh/gKkUb/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip

RUN unzip /tmp/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip -d /tmp && \
    rm /tmp/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip && \
	chmod +x /tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh
	
RUN cd /tmp && \
    sh -c '/tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh --tar -xvf'

COPY setup.sh /tmp

RUN sh -c '/tmp/setup.sh'

RUN rm -rf /tmp/*
