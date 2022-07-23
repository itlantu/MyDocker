# MyDocker 个人docker配置

<img src="https://img.shields.io/badge/docker-ubuntu:20.04-orange"> <img src="https://img.shields.io/badge/laster-0.2-blue"> 


<br>

## 简介

### MyDocker项目是一个个人docker配置项目，继承了ubuntu:20.04的docker镜像，使用了[code-server](https://github.com/microsoft/vscode) (code-server项目是一款遵循MIT许可证的开源网页代码编辑器)
> code-server项目的GitHub仓库地址为:https://github.com/microsoft/vscode

<br>

## 构建
> 通过Dockerfile文件构建，需要先git clone本项目，然后再执行`docker run `构建命令

```sh
git clone https://github.com/itlantu/MyDocker.git
cd MyDocker
docker run -t lantu/ubuntu:0.2 .
```
> 由于网络可能造成的延迟等问题，构建时间可能会在`4-7分钟`波动
> 其中的`lantu/ubuntu:0.2`可自行替换，但需要遵循`name:tag`格式

<br>

## 项目包含

* apt换成阿里云的源
* 初步配置好的code-server,设置成开启容器自动启动
* 通过apt安装了curl,systemctl,vim

<br>

## 访问code-server
> code-server被设置为默认在`0.0.0.0:8080`开启，在docker外可通过`hostlocal:8080`访问，这个开放的ip和端口可以在`~/.config/code-server/config.yaml`配置文件更改，关于code-server的更多详细内容请访问code-server项目的文档了解
* 首先，需要保证你的容器（已经构建好了的容器）开启了`8080`端口的映射
```sh
docker -it -p 8080:8080 lantu/ubuntu:0.2
```
* 然后在浏览器访问地址`localhost:8080`即可

<br>

## 问题
* 更新中...
