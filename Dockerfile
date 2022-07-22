FROM ubuntu:20.04

MAINTAINER lantu "it_lantu@outlook.com"

# 下载vscode—server
ADD ./script/vs-code.install.sh /app/vsc.sh
RUN cd /app \
  | chmod u+x vsc.sh \
  && ./vsc.sh

# 下载一些实用工具类软件
RUN apt install -y libncursesw5-dev autotools-dev autoconf build-essential htop libev-dev libssl-dev curl openssh-server clang
