# MyDocker  个人docker配置

<img src="https://img.shields.io/badge/docker-ubuntu:20.04-orange"> <img src="https://img.shields.io/badge/laster-0.3-blue"> 

-------------
<img src="https://github.com/itlantu/MyDocker/blob/img/1.jpg?raw=true">

## 简介

### MyDocker项目是一个个人docker配置项目，继承了ubuntu:20.04的docker镜像，使用了[code-server](https://github.com/microsoft/vscode) (code-server项目是一款遵循MIT许可证的开源网页代码编辑器)，开启容器后，可以在网页中使用code-server，开箱即用
> code-server项目的GitHub仓库地址为:https://github.com/microsoft/vscode

## 项目包含

* 继承了ubuntu 20.04的镜像
* apt源换为清华源
* 初步安装并配置好的code-server,设置成开启容器自动启动
* 通过apt安装了curl,wget,git,vim
* 将code-server的deb包分割成两个文件，发布到[gitee](https://gitee.com/itlantu/MyDocker/releases/tag/4.7)并通过其下载,使得下载code-server安装包更快

## 开放端口

开放的端口可在Dockerfile文件中修改，如使用默认的话可能会开放`8080`和`8081`两个端口

* `8080`端口默认被code-server占用
* `8081`端口没有被任何程序占用

## 快速上手 （当前正在更新下一个版本，建议从Releases下载以前的版本）
> 本项目构建的镜像已推送到docker hub，可通过docker push命令拉取镜像

```sh
docker pull itlantu/ubuntu
```

## 构建

![](https://github.com/itlantu/MyDocker/blob/img/ver0.3build.jpg?raw=true)

> 通过Dockerfile文件构建，需要先git clone本项目，然后再执行`docker build `构建命令
>> 在Dockerfile中使用了copy指令，并通过国内的gitee下载code-server安装包，使得构建更快

```sh
git clone https://github.com/itlantu/MyDocker.git
cd MyDocker
docker build -t itlantu/ubuntu:0.3 .
```
> 由于网络可能造成的延迟等问题，构建时间可能会在`2-4分钟`波动
> 其中的`itlantu/ubuntu:0.3`可自行替换，但需要遵循`name:tag`格式
> 建议将docker换成国内源

<br>

## 访问code-server
> code-server被设置为默认在`0.0.0.0:8080`开启，可通过浏览器访问`hostlocal:8080`打开访问界面
>code-server的开放的ip和端口可以在`~/.config/code-server/config.yaml`配置文件更改，关于code-server的更多详细内容请访问code-server项目的文档了解

* 首先，需要保证（已经构建好了的）容器开启了`8080`端口的映射

```sh
docker -it -p 8080:8080 itlantu/ubuntu:0.3
```
* 然后在浏览器访问地址`localhost:8080`即可
* 默认密码为`123456`

<br>

## 问题

<br>

 更多问题正在更新中...

<br>

### 如有其他问题可以提交issues




