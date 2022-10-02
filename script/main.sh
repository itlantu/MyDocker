#!/bin/bash

path=/home/MyDocker       

filedeb="code-server.deb" # code-server的deb的文件名
fileSpiltName1="xaa"               # code-server的deb的第一个切片的文件名
fileSpiltName2="xab"               # code-server的deb的第二个切片的文件名
debUrl="https://gitee.com/itlantu/MyDocker/releases/download/4.7"

# aptInstallList数组存放需要apt install的软件名称，这些软件将会在aptInstall函数的循环被依次apt install
aptInstallList=("curl" "wget" "git" "vim")

# 存储code-server的配置文本的关联数组，存储的内容将会被写入code-server的配置文件
declare -A codeServerConfig
codeServerConfig["bind-addr"]="0.0.0.0:8080" # 默认端口
codeServerConfig["auth"]="password"          # 登录方式
codeServerConfig["password"]="123456"        # 登录密码
codeServerConfig["cert"]="false"             #


# 用$1文件替换$2文件，$2文件将会被删除
fileReplace(){
    rm -f $2
    cp $1 $2
}

# apt换源函数
sources(){
    # 源备份
    cp /etc/apt/sources.list /etc/apt/sources.list.pak
    # 换源
    
    fileReplace $path/sources.list /etc/apt/sources.list
}

# 通过apt下载一些软件
aptInstall(){
    apt update

    # 遍历aptInstallList数组，执行apt install
    for name in $aptInstallList 
    do
        apt install -y  $name
    done
}

# 下载并安装code-server
CodeServerDebInstall(){
    if [ ! -d $path/package ];then
        mkdir $path/package
    fi

    cd $path/package

    # 是否存在code-server.deb包
    if [ ! -e $filedeb ];then
        # 检查是否存在被切片的code-server.deb包，不存在则下载

        # 检查xxa文件是否存在，不存在则下载
        if [ ! -e $fileSpiltName1 ];then
            wget -P . "${debUrl}/${fileSpiltName1}"
        fi

        # 检查xxb文件是否存在，不存在则下载
        if [ ! -e $fileSpiltName2 ];then
            wget -P . "${debUrl}/${fileSpiltName2}"
        fi

        # 将切片合成完整的code-server deb包
        cat $file1 $file2 > code-server.deb
    fi

    # 安装code-server的deb包
    dpkg -i code-server.deb

    # 删除安装包切片文件和code-server安装包
    rm -f xaa
    rm -f xab
    

}

# 根据codeServerConfig关联数组，初始化code-server的配置
CodeSeverInit(){
    # 创建配置文件
    mkdir /home/coder
    mkdir ~/.config/
    mkdir ~/.config/code-server
    # fileReplace $path/script/config.yaml ~/.config/code-server/config.yaml

    # 根据codeServerConfig关联数组的内容生成字符串str
    str="bind-addr: ${codeServerConfig["bind-addr"]}\n"\
    str+="auth: ${codeServerConfig["auth"]}\n"\
    str+="password:${codeServerConfig["password"]}\n"\
    str+="cert:${codeServerConfig["cert"]}"

    # 将str写入code-server的配置文件
    echo -e ${str} >> ~/.config/code-server/config.yaml
}

# main函数将会执行所有函数
main(){
    sources
    aptInstall
    CodeServerDebInstall
    CodeSeverInit
}

# 执行main函数
main

