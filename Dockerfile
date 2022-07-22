FROM debian:latest

MAINTAINER lantu "it_lantu@outlook.com"

# 下载vscode—server
WORKDIR /app
ADD ./script/vs-code.install.sh /app
RUN chmod u+x ./vs-code.install.sh
RUN ./vs-code.install.sh
