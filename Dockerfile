FROM ubuntu:bionic

MAINTAINER Francois Rainville <francoisrainville@effenco.com>

RUN apt-get -y update && \
    apt-get -y install wget && \
	apt-get -y install unzip && \
	apt-get -y install tar && \
	apt-get -y install curl

# Install miniconda
RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /opt/miniconda && \
	ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

# Install usefull python packages
RUN /opt/miniconda/bin/pip install crcmod && \
    /opt/miniconda/bin/pip install intelhex

# Install st-stm32cubeide
RUN wget --quiet -P /tmp https://www.dropbox.com/s/akl3m428no229t3/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip?dl=1 && \
    mv /tmp/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip?dl=1 /tmp/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip && \
    unzip /tmp/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip -d /tmp && \
    rm /tmp/en.st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh.zip && \
	chmod +x /tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh && \
    sh -c '/tmp/st-stm32cubeide_1.3.0_5720_20200220_1053_amd64.sh --tar -xvf -C /tmp' && \
	rm /tmp/setup.sh

COPY setup.sh /tmp

RUN sh -c '/tmp/setup.sh'

RUN rm -rf /tmp/*
