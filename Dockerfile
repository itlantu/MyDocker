FROM ubuntu:20.04

MAINTAINER lantu "it_lantu@outlook.com"

# 下载vscode—server
WORKDIR /app
ADD ./script/vs-code.install.sh /app
RUN chmod u+x ./vs-code.install.sh \
  | ./vs-code.install.sh

# 下载一些实用工具类软件
RUN apt install -y libncursesw5-dev autotools-dev autoconf build-essential htop libev-dev libssl-dev curl openssh-server clang
