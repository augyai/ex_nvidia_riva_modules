VERSION 0.7
FROM elixir:1.14-otp-25-slim

setup-base:
    ARG PROTOC_VERSION=23.1
    RUN apt-get update -y && \
        apt-get install -y unzip curl git
    RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip && \
        unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /usr/local bin/protoc && \
        unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /usr/local include/* && \
        rm -f protoc-${PROTOC_VERSION}-linux-x86_64.zip
    RUN mix local.hex --force && \
        mix local.rebar --force && \
        mix escript.install hex protobuf --force
    WORKDIR /app

build:
    ARG TAG 
    VOLUME /tmp/src /app/src
    FROM +setup-base
    WORKDIR /app/src
    GIT CLONE --branch $TAG https://github.com/nvidia-riva/common.git common
    WORKDIR /app/src/common
    RUN PATH=~/.mix/escripts:$PATH && mkdir /app/output && protoc -I /app/src/common --elixir_out=plugins=grpc:/app/output /app/src/common/riva/proto/*.proto
    SAVE ARTIFACT /app/output/riva 