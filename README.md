# MyDocker  个人docker配置

<img src="https://img.shields.io/badge/docker-ubuntu:20.04-orange"> <img src="https://img.shields.io/badge/laster-0.2-blue"> 

-------------
<img src="https://github.com/itlantu/MyDocker/blob/img/1.jpg?raw=true">

## 简介

### MyDocker项目是一个个人docker配置项目，继承了ubuntu:20.04的docker镜像，使用了[code-server](https://github.com/microsoft/vscode) (code-server项目是一款遵循MIT许可证的开源网页代码编辑器)，开启容器后，可以在网页中使用code-server，开箱即用
> code-server项目的GitHub仓库地址为:https://github.com/microsoft/vscode

## 项目包含

* apt换成阿里云的源
* 初步配置好的code-server,设置成开启容器自动启动
* 通过apt安装了curl,systemctl,vim

## 快速上手
> 本项目构建的镜像已推送到docker hub，可通过docker push命令拉取镜像

```sh
docker pull itlantu/ubuntu
```

## 构建
> 通过Dockerfile文件构建，需要先git clone本项目，然后再执行`docker run `构建命令

```sh
git clone https://github.com/itlantu/MyDocker.git
cd MyDocker
docker run -t itlantu/ubuntu:0.2 .
```
> 由于网络可能造成的延迟等问题，构建时间可能会在`4-7分钟`波动
> 其中的`itlantu/ubuntu:0.2`可自行替换，但需要遵循`name:tag`格式

<br>

## 访问code-server
> code-server被设置为默认在`0.0.0.0:8080`开启，在docker外可通过`hostlocal:8080`访问，这个开放的ip和端口可以在`~/.config/code-server/config.yaml`配置文件更改，关于code-server的更多详细内容请访问code-server项目的文档了解
* 首先，需要保证你的容器（已经构建好了的容器）开启了`8080`端口的映射

```sh
docker -it -p 8080:8080 itlantu/ubuntu:0.2
```
* 然后在浏览器访问地址`localhost:8080`即可
* 默认密码为`123456`

<br>

## 问题

### 1.vs-code.install.sh无法运行

> executor failed running [/bin/sh -c bash /home/MyDocker/script/vs-code.install.sh]: exit code: 7

<img src="https://github.com/itlantu/MyDocker/blob/img/vs-code.install.sh.Error.jpg?raw=true">

* 产生的原因：`vs-code.install.sh`脚本复制于code-server项目，运行后会自行下载code-server的deb安装包，可能是由于网络问题导致下载失败，解决的方法是重新输入docker build指令，由于缓存机制，构建时会很快就回到运行`vs-code.install.sh`脚本的地方，可能需要多次尝试才能下载成功

```sh
 docker build itlantu/ubuntu
```

### 2.git clone 失败 （连接被拒绝）

>  fatal: unable to access 'https://github.com/itlantu/MyDocker.git/': Failed to connect to github.com port 443: Connection refused

<img src = "https://github.com/itlantu/MyDocker/blob/img/git_clone_443.Error.jpg?raw=true">

* 产生的原因：网络问题，请检查你当前的网络环境，也有可能是开启Github加速器造成的（亲测开启fastgithub加速器会导致这种情况），可以关闭加速器后再次输入docker build命令

```sh
 docker build itlantu/ubuntu
```


### 如有其他问题可以提交issues

<br>

### 更多问题正在更新中...
