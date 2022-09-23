# 继承ubuntu20.04镜像
FROM ubuntu:20.04

MAINTAINER itlantu "it_lantu@outlook.com"

# 暴露8080端口和8081端口
EXPOSE 8080/tcp
EXPOSE 8081/tcp

RUN mkdir /home/MyDocker

COPY / /home/MyDocker
RUN bash /home/MyDocker/script/main.sh

#开机自动执行code-server
CMD ["code-server"]

# 指定工作路径
WORKDIR /home/



