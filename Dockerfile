FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y \
    net-tools \
    nano \
    wget \
    screen \
    libpcap-dev && apt-get clean

WORKDIR /usr/src/app

COPY src/ ./

RUN apt-get update && \
    apt-get -qq -y install \
    python3 \
    build-essential \
    python3-dev \
    python3-pip

RUN pip3 install --no-cache-dir -r requirements.txt

RUN wget http://www.udpxy.com/download/1_23/udpxy.1.0.23-9-prod.tar.gz
RUN tar -xzvf udpxy.1.0.23-9-prod.tar.gz
RUN cd udpxy-1.0.23-9 && make && make install

CMD ["/bin/bash"]
