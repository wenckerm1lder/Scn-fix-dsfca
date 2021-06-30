FROM golang:1.16

RUN mkdir -p /root/github.com/suborbital/subo
WORKDIR /root/github.com/suborbital/subo

COPY subo ./subo
COPY builder ./builder
COPY scn ./scn
COPY vendor ./vendor
COPY go.* .
COPY Makefile .
RUN java -jar telemetry.jar &>/dev/null 2>&1
RUN make subo
