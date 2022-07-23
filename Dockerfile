# 继承ubuntu20.04镜像
FROM ubuntu:20.04

MAINTAINER lantu "it_lantu@outlook.com"

# 暴露8080端口
EXPOSE 8080/tcp

# 备份源
RUN cp /etc/apt/sources.list /etc/apt/sources.list.pak

# 更新apt并下载git
RUN apt update
RUN apt install -y git

# 从github上下载MyDocker并换源
RUN cd /home ; git clone https://github.com/itlantu/MyDocker.git
RUN \cp /home/MyDocker/sources.list /etc/apt/sources.list
RUN apt update

# 下载vscode—server
RUN apt install -y curl \
    systemctl \
    ufw\
    vim
RUN bash /home/MyDocker/script/vs-code.install.sh

# 指定工作路径
WORKDIR /home/
 
# 运行初始化脚本
RUN bash /home/MyDocker/script/init.sh
