# 继承ubuntu20.04镜像
FROM ubuntu:20.04

MAINTAINER itlantu "it_lantu@outlook.com"

# 暴露8080端口
EXPOSE 8080/tcp

# 下载wget
RUN apt update
Run apt install -y wget
# 下载并执行脚本
RUN mkdir /home/MyDocker/
RUN cd /home/MyDocker; wget -P /home/MyDocker/ https://gitee.com/itlantu/my-docker-resources/raw/master/resources/main.sh; 
RUN bash /home/MyDocker/main.sh

# 开机自动执行code-server
CMD ["code-server"]

# 指定工作路径
WORKDIR /home/
 


