# 继承ubuntu20.04镜像
FROM ubuntu:20.04

MAINTAINER lantu "it_lantu@outlook.com"


# 备份源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.pak


# 更新apt并下载git
RUN apt update
RUN apt install -y git

# 从github上下载MyDocker并换源
RUN cd /home ; git clone https://github.com/itlantu/MyDocker.git
RUN \cp /home/MyDocker/sources.list /etc/apt/sources.list
RUN apt update

# 下载一些常用的开发软件
RUN apt install -y clang  vim

# 下载vscode—server
RUN apt install -y curl systemctl wget
RUN cd /home/MyDocker/script/ ; bash vs-code.install.sh

# 下载一些实用工具类软件
RUN apt install -y libncursesw5-dev autotools-dev autoconf build-essential htop libev-dev libssl-dev ufw

# 防火墙开放端口
RUN ufw allow 8080
RUN ufw allow 9999
 
