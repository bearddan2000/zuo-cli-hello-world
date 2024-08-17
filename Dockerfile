FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workspace

RUN apt update

RUN apt-get install -y gcc git

RUN git clone https://github.com/racket/zuo.git

WORKDIR /workspace/zuo

RUN gcc -o zuo *.c \
    && ln -s /workspace/zuo/zuo /bin/zuo

WORKDIR /code

COPY bin .

CMD "./run.sh"