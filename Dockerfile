FROM ubuntu:jammy

#AUTHOR Francois Rainville <francoisrainville@effenco.com>

RUN apt-get -y update && \
    apt-get -y install wget && \
	apt-get -y install unzip && \
	apt-get -y install tar && \
	apt-get -y install curl&& \
    apt-get -y install git && \
    apt-get -y install ssh

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
COPY en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip /tmp/en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip
#RUN \
#RUN wget -P /tmp "https://www.dropbox.com/scl/fi/yj7ltrdj25ibroz1ve0d9/en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip?rlkey=7r43nfp8gu4sgetny0pgjogeh&dl=1"

#RUN mv "/tmp/en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip?rlkey=7r43nfp8gu4sgetny0pgjogeh&dl=1" "/tmp/en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip" && \
 RUN unzip "/tmp/en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip" -d /tmp && \
    rm "/tmp/en.st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh.zip" && \
	chmod +x "/tmp/st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh" && \
    sh -c '/tmp/st-stm32cubeide_1.16.0_21983_20240628_1741_amd64.sh --tar -xvf -C /tmp' && \
	rm /tmp/setup.sh

COPY setup.sh /tmp

RUN chmod +x /tmp/setup.sh && \
    /tmp/setup.sh

RUN rm -rf /tmp/*
