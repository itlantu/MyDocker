# MyDocker  个人docker配置

<img src="https://img.shields.io/badge/docker-ubuntu:20.04-orange"> <img src="https://img.shields.io/badge/laster-0.4-blue"> 
<img src="https://img.shields.io/badge/codeServer-4.7-red">
<img src="https://github.com/itlantu/MyDocker/blob/img/1.jpg?raw=true">
-------------


## 简介 （建议从Releases下载0.4版本）

### MyDocker 是一个个人开发的docker镜像项目,该镜像以`ubuntu:20.04镜像`为基础镜像，并进行了以下的操作

* 通过shell脚本自动执行apt换源([清华源](https://mirrors.tuna.tsinghua.edu.cn/))
* 通过apt下载的`curl`,`wget`,`git`,`vim` 
* 通过[gitee](https://gitee.com/itlantu/MyDocker/releases/tag/4.7)下载的`code-server`([code-server项目在github上开源](https://github.com/coder/code-server))，并进行了初始化配置
* 容器开启则自动执行`code-server`指令，运行code-server
* 默认开放了`8080`端口(code-server使用) 和 `8081`端口(无程序占用，可自定义使用)

> [code-server](https://github.com/coder/code-server)是一款在github开源的网页代码编辑器，本项目将code-server的deb包分割成两个文件，发布到[gitee](https://gitee.com/itlantu/MyDocker/releases/tag/4.7)并通过其下载,使得在国内下载code-server安装包更快

<br>

## 快速上手 

> 本项目构建的镜像已推送到docker hub，可通过docker pull命令拉取镜像

```sh
docker pull itlantu/ubuntu 0.4
```

> 通过构建也可以得到镜像



## 构建

![](https://github.com/itlantu/MyDocker/blob/img/ver0.4build.jpg?raw=true)

* 需要从master分支或对应版本的分支拉取仓库
* 执行`docker build`构建命令

```sh
git clone https://github.com/itlantu/MyDocker.git
cd MyDocker
docker build -t itlantu/ubuntu:0.4 .
```
> 由于网络可能造成的延迟等问题，构建时间可能会在`2-4分钟`波动
> 建议将docker换成国内源，并开启docker的buildkit构建

<br>

## 访问code-server 
> code-server被设置为默认在`0.0.0.0:8080`开启，可通过浏览器访问`hostlocal:8080`打开访问界面
>code-server的开放的ip和端口可以在`main.sh`脚本中修改，关于code-server的更多详细内容请访问code-server项目的文档了解

* 首先，需要保证(已经构建好了的)容器开启了`8080`端口的映射

```sh
docker -it -p 8080:8081 itlantu/ubuntu:0.4
```

* 然后在浏览器访问地址`localhost:8080`即可
* 默认密码为`123456`

<br>

## 问题

<br>

 更多问题正在更新中...

<br>

### 如有其他问题可以提交issues
