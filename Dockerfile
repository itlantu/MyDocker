# 继承ubuntu20.04镜像
FROM ubuntu:20.04

MAINTAINER itlantu "it_lantu@outlook.com"

# 暴露8080端口
EXPOSE 8080/tcp

# 下载wget
Run apt install wget
RUN cd home;wegt https://github.com/itlantu/MyDocker/raw/main/script/main.sh;bash main.sh

# 开机自动执行code-server
CMD ["code-server"]

# 指定工作路径
WORKDIR /home/
 


