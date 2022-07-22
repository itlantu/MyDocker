FROM debian:latest

MAINTAINER lantu "it_lantu@outlook.com"

RUN apt-get update && apt-get install -y \
    vim \
    wget \
    curl \
    git-core

# 下载vscode—server
WORKDIR /app
ADD ./script/vs-code.install.sh /app
RUN chmod u+x ./vs-code.install.sh
RUN ./vs-code.install.sh
