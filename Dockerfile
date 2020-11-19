FROM ubuntu:bionic

#AUTHOR Francois Rainville <francoisrainville@effenco.com>

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

#COPY en.st-stm32cubeide_1.4.0_7511_20200720_0928_amd64_sh.zip /tmp/en.st-stm32cubeide_1.4.0_7511_20200720_0928_amd64_sh.zip
RUN wget --quiet -P /tmp https://www.dropbox.com/s/tilvl25ysxj929c/en.en-st-stm32cubeide_1-5-0_8698_20201117_1050_amd64_sh.zip?dl=1 && \
    mv /tmp/en.en-st-stm32cubeide_1-5-0_8698_20201117_1050_amd64_sh.zip?dl=1 /tmp/en.en-st-stm32cubeide_1-5-0_8698_20201117_1050_amd64_sh.zip && \
    unzip /tmp/en.en-st-stm32cubeide_1-5-0_8698_20201117_1050_amd64_sh.zip -d /tmp && \
    rm /tmp/en.en-st-stm32cubeide_1-5-0_8698_20201117_1050_amd64_sh.zip && \
	chmod +x /tmp/st-stm32cubeide_1.5.0_8698_20201117_1050_amd64.sh && \
    sh -c '/tmp/st-stm32cubeide_1.5.0_8698_20201117_1050_amd64.sh --tar -xvf -C /tmp' && \
	rm /tmp/setup.sh

COPY setup.sh /tmp

RUN chmod +x /tmp/setup.sh && \
    /tmp/setup.sh

RUN rm -rf /tmp/*
