FROM debian:latest

MAINTAINER lantu "it_lantu@outlook.com"

RUN apt install -y libncursesw5-dev autotools-dev autoconf build-essential htop libev-dev libssl-dev curl openssh-server clang

# 下载vscode—server
WORKDIR /app
ADD ./script/vs-code.install.sh /app
RUN chmod u+x ./vs-code.install.sh
RUN ./vs-code.install.sh
